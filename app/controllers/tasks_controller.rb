class TasksController < ApplicationController
  before_action :set_projects

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to root_path
    else
      flash.now[:alert] =  'タイトルを入力してください。'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    else
      flash.now[:alert] =  'タイトルを入力してください。'
      render :new
    end
  end

  private
  def set_projects
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :status).merge(project_id: params[:project_id])
  end


end
