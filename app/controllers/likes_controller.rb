class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy]

  def index
    # ユーザーがお気に入り登録したレビューのidを取得
    like_ids = Like.where(user_id: current_user.id).pluck(:review_id)
    # N+1問題への対応のため、予め必要な情報を入れておく
    @reviews = Review.with_book_user_likers.where(id: like_ids).page(params[:page]).per(5)
  end

  def create
    @review = Review.find(params[:review_id])
    rerurn if @review.after_like?(current_user)

    @review.like(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
  end

  def destroy
    @review = Like.find(params[:id]).review
    return unless @review.after_like?(current_user)

    @review.unlike(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
  end
end
