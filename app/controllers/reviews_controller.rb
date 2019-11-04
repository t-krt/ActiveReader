class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_review_with_book, only: %i[edit update show destroy]
  before_action :reviewer_equal_current_user?, only: %i[edit update destroy]

  def index
    @reviews = Review.read.with_book_user_likers.page(params[:page]).per(5)
    @search = @reviews.ransack(params[:q])
    @results = @search.result(distinct: true)
    @check = params[:q] # 条件分岐用に設定
  end

  def new
    @book = Book.new
    @book.title = params[:title]
    @book.author = params[:author]
    @book.image_url = params[:image_url]
    @book.url = params[:url]
    @book.isbn = params[:isbn]
    @review = Review.new
  end

  def create
    @book = Book.where(isbn: book_params[:isbn]).first_or_create(book_params)
    @review = Review.create(review_params)
    if @book.save && @review.save
      if @review[:review_status] == "reading"
        new_review = Review.last
        now_reading = Review.reading.where.not(id: new_review[:id]).find_by(user_id: current_user.id)
        now_reading&.change_state_stock
      end
      redirect_to review_path(@review)
      flash[:notice] = 'レビューを登録しました'
    else
      flash[:notice] = '正しく入力してください'
      render :new
    end
  end

  def edit; end

  def show
    tasks = Task.where(review_id: @review.id)
    @unfinished_tasks = tasks.unfinished.desc.page(params[:page]).per(5)
    @finished_tasks = tasks.finished.desc.page(params[:page]).per(5)
    @user = User.find(@review.user_id)
  end

  def update
    if @book.update(book_params) && @review.update(review_params)
      if @review[:review_status] == "reading"
        now_reading = Review.reading.where.not(id: @review[:id]).find_by(user_id: current_user.id)
        now_reading&.change_state_stock
      end
      redirect_to review_path(@review)
      flash[:notice] = 'レビューを更新しました'
    else
      flash[:notice] = '正しく入力してください'
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to reading_user_path(current_user), notice: "削除しました"
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :image_url, :url, :isbn)
  end

  def review_params
    params.require(:review).permit(:purpose, :learned, :note, :rate, :review_status, :deadline)\
          .merge(user_id: current_user.id, book_id: @book.id)
  end

  def set_review_with_book
    @review = Review.find(params[:id])
    @book = Book.find(@review.book_id)
  end

  def reviewer_equal_current_user?
    redirect_to reading_user_path(current_user) unless @review.user_id == current_user.id
  end
end
