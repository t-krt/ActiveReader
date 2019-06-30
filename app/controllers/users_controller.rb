class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @reading_book = Review.includes(:book, :user).find_by(user_id: current_user.id, review_status: "reading")
    # @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
  
end
