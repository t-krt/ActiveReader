class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    reviews = Review.where(user_id: current_user.id).order("reviews.created_at DESC").includes(:book, :tasks)
    @unfinished_task_reviews = reviews.where(tasks: {finished: 0}).page(params[:page]).per(5)    
    @finished_task_reviews = reviews.where(tasks: {finished: 1}).page(params[:page]).per(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    respond_to do |format|
      format.html {redirect_to root_path }
      format.json
    end
  end

  private
  def task_params
    params.require(:task).permit(:content, :limit).merge(user_id: current_user.id)
  end
end
