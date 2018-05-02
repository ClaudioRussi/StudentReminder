class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @subject = Subject.find(params[:subject_id])
    @tasks = @subject.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @subject = subject.find(params[:subject_id])
    @task = @subject.build()
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @task = @subject.tasks.build(task_params)
    if(@task.save)
      redirect_to @subject
    else
      render 'subjects/show'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if(@task.save)
      redirect_to @task.subject
    else
      render 'edit'
    end
  end

  def destroy
    subject = @task.subject
    Task.destroy(params[:id])
    redirect_to subject
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :date)
  end
end
