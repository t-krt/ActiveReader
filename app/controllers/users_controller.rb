class UsersController < ApplicationController
  before_action :authenticate_user!

  # def show
  #   @reading_book = Review.includes(:book, :user).find_by(user_id: current_user.id, review_status: "reading")
  # end

  def reading
    @reading_book = Review.reading.with_book.find_by(user_id: current_user.id)
  end

  def read
    @read_books = Review.read.with_book.desc.where(user_id: current_user.id).page(params[:page]).per(6)
  end

  def stock
    @stock_books = Review.stock.with_book.desc.where(user_id: current_user.id).page(params[:page]).per(6)
  end
end
