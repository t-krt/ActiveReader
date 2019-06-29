class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    # @book = Book.find(params[:book_id])
    # @review = ReviewForm.new
    # @task = Task.new
    @book = Book.new
    @review = Review.new
    @task = Task.new
  end

  def create
    @book = Book.create(book_params)
    @review = Review.create(review_params)
    if @book.save && @review.save
      redirect_to user_path(current_user)
    else
      flash[:notice] = '正しく入力してください'
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :image, :genre\
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
end
