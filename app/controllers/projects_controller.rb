class ProjectsController < ApplicationController

  def index
    if session[:user_id]
      @projects = Project.where(user_id: session[:user_id])
      @project = Project.new
    else
      redirect_to new_session_path
    
    end
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @todos = @tasks.where(status: 0)
    @doings = @tasks.where(status: 1)
    @dones = @tasks.where(status: 2)
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:name).merge(user_id: session[:user_id])
  end
end
