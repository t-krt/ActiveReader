class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    reviews = Review.where(user_id: current_user.id).order("reviews.created_at DESC").includes(:book, :tasks)
    @unfinished_task_reviews = reviews.where(tasks: {finished: 0}).page(params[:page]).per(5)    
    @finished_task_reviews = reviews.where(tasks: {finished: 1}).page(params[:page]).per(5)
  end

  def new; end

  def create
  end

end
