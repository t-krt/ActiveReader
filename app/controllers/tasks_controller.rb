class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    reviews = Review.where(user_id: current_user.id).order("reviews.created_at DESC").includes(:book, :tasks)
    @unfinished_task_reviews = reviews.where(tasks: {finished: 0}).page(params[:page]).per(5)    
    @finished_task_reviews = reviews.where(tasks: {finished: 1}).page(params[:page]).per(5)

    # has_task_reviews = Review.where(id: Task.select(:review_id).group(:review_id).having("count(review_id)>=?", 1))
    # @reviews = has_task_reviews.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC").includes(:book, :tasks)  
  end

  def new; end
end
