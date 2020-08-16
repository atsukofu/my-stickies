class ProjectsController < ApplicationController

  def index
    if session[:user_id]
      @projects = Project.where(user_id: session[:user_id]).page(params[:page]).per(5)
      @project = Project.new
    else
      flash[:notice] = "ログインしてください"
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
      flash[:success] = "新しいプロジェクトを作成しました"
      redirect_to root_path
    else
      @projects = Project.where(user_id: session[:user_id])
      flash.now[:alert] = "プロジェクト名を正しく入力してください"
      render :index
    end
  end

  private
  def project_params
    params.require(:project).permit(:name).merge(user_id: session[:user_id])
  end
end
