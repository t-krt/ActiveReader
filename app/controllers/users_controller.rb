class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def reading
    @reading = Review.reading.with_book.find_by(user_id: params[:id])
  end

  def read
    @reads = Review.read.with_book.desc.where(user_id: params[:id]).page(params[:page]).per(6)
  end

  def stock
    @stocks = Review.stock.with_book.desc.where(user_id: params[:id]).page(params[:page]).per(6)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
