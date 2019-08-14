class UsersController < ApplicationController
  before_action :authenticate_user!

  # def show
  #   @reading_book = Review.includes(:book, :user).find_by(user_id: current_user.id, review_status: "reading")
  # end

  def reading
    @reading_book = Review.includes(:book, :user).find_by(user_id: current_user.id, review_status: "reading")
  end

  def read
    @read_books = Review.includes(:book, :user).where(user_id: current_user.id, review_status: "read").page(params[:page]).per(6).order("created_at DESC")
  end

  def stock
    @stock_books = Review.includes(:book, :user).where(user_id: current_user.id, review_status: "stock").page(params[:page]).per(6).order("created_at DESC")
  end
end
