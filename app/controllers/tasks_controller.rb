class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    has_task_reviews = Review.where(id: Task.select(:review_id).group(:review_id).having("count(review_id)>=?", 1))
    @reviews = has_task_reviews.where(user_id: current_user.id,).page(params[:page]).per(5).order("created_at DESC").includes(:book, :tasks)
  end

  def new; end
end
