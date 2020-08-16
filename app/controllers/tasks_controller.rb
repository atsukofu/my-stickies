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
      flash[:success] = 'タスクを作成しました。'
      redirect_to project_path(@project)
    else
      flash.now[:alert] = 'タイトルを正しく入力してください。'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'タスクを更新しました。'
      redirect_to project_path(@project)
    else
      flash.now[:alert] = 'タイトルを入力してください。'
      render :new
    end
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private
  def set_projects
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :status).merge(project_id: params[:project_id])
  end


end
