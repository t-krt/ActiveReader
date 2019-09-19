class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy, :finish]
  before_action :set_review, only: [:new, :edit]

  def index
    @reviews = Review.includes(:book, :tasks).where(user_id: current_user.id).order(created_at: "DESC").page(params[:page]).per(5)    
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

  def finish
    respond_to do |format|
      if @task.update(finished: true)
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
