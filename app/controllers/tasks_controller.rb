class TasksController < ApplicationController
  before_action :find, only: %w[show edit update]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    @task.save!
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(params_task)
    redirect_to tasks_path(@task)
  end

  private

  def find
    @task = Task.find(params[:id])
  end

  def params_task
    params.require(:task).permit(:title, :details)
  end
end
