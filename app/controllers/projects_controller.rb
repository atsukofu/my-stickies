class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
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

  def project_params
    params.require(:project).permit(:name)
  end
end
