class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @todos = @tasks.where(status: 0)
    @doings = @tasks.where(status: 1)
    @dones = @tasks.where(status: 2)
  end

  def new 
    @project = Project.new
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
    params.require(:project).permit(:name)
  end
end
