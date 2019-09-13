class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :set_review, only: [:new, :edit]

  def index
    reviews = Review.where(user_id: current_user.id).order("reviews.created_at DESC").includes(:book, :tasks)
    @unfinished_task_reviews = reviews.where(tasks: {finished: 0}).page(params[:page]).per(5)    
    @finished_task_reviews = reviews.where(tasks: {finished: 1}).page(params[:page]).per(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.js { @status = "success"}
      else
        format.js {@status = "fail"}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js { @status = "success"}
      else
        format.js {@status = "fail"}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @task.destroy
        format.js { @status = "success"}
      else
        format.js {@status = "fail"}
      end
    end
  end


  private
  def task_params
    params.require(:task).permit(:content, :limit, :review_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_review
    @review = Review.find(params[:review_id])
  end
end
