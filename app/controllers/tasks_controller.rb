class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[edit update destroy finish]
  before_action :set_review, only: %i[new edit]
  before_action :owenr_equal_current_user?, only: %i[edit update destroy]

  def index
    @reviews = Review.with_book.desc.where(user_id: current_user.id).page(params[:page]).per(5)
    @user = User.find(current_user.id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @task.destroy
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
  end

  def finish
    respond_to do |format|
      @task.update_finished_true
      format.js { @status = "success" }
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

  def owenr_equal_current_user?
    redirect_to reading_user_path(current_user) unless @task.review.user_id == current_user.id
  end
end
