class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy]

  def create
    @review = Review.find(params[:review_id])
    unless @review.after_like?(current_user)
      @review.like(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @review = Like.find(params[:id]).review
    if @review.after_like?(current_user)
      @review.unlike(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
