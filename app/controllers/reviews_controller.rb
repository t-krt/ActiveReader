class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review_with_book, only: [:edit, :update, :show, :destroy]

  def index
  end

  def new
    @book = Book.new
    @book.title, @book.author, @book.image_url, @book.url, @book.isbn = \
    params[:title], params[:author], params[:image_url], params[:url], params[:isbn]
    @review = Review.new
    @task = Task.new
  end

  def create
    @book = Book.where(isbn: book_params[:isbn]).first_or_create(book_params)
    @review = Review.create(review_params)
    # TODO:scopeで書き直す？
    if @book.save && @review.save
      if @review[:review_status] == "reading"
        last_review = Review.last
        was_reading = Review.where.not(id: last_review[:id]).find_by(user_id: current_user.id, review_status: "reading")
        was_reading.update(review_status: "stock") if was_reading
      end
      redirect_to reading_path(current_user)
      flash[:notice] = '本を登録しました'
    else
      flash[:notice] = '正しく入力してください'
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @review.user_id == current_user.id
      if @book.update(book_params) && @review.update(review_params)
        if @review[:review_status] == "reading"
          was_reading = Review.where.not(id: @review[:id]).find_by(user_id: current_user.id, review_status: "reading")
          was_reading.update(review_status: "stock") if was_reading
        end
        redirect_to reading_path(current_user)
        flash[:notice] = '本の情報を更新しました'
      else
        flash[:notice] = '正しく入力してください'
        render :new
      end
    end
  end

  def destroy
    @review.destroy if @review.user.id == current_user.id
    redirect_to reading_path(current_user), notice: "削除しました"
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :author, :image_url, :genre, :url, :isbn\
      # book_categories_attributes: [:book_id, :category_id], \
      # reviews_attributes: [:purpose, :learned, :note, :rate, :review_status, :deadline,\
         # ,tasks_attributes: [:task_content, :finished]
        # ]
      )
  end

  def review_params
    params.require(:review).permit(:purpose, :learned, :note, :rate, :review_status, :deadline)\
    .merge(user_id: current_user.id, book_id: @book.id)
  end

  def set_review_with_book
    @review = Review.find(params[:id])
    @book = Book.find(@review.book_id)
  end

end
