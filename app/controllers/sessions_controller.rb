class SessionsController < ApplicationController
  def new
    if session[:user_id]
      flash[:alert] = "すでにログインしています"
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.username
      flash[:success] = 'ログインしました'
      redirect_to root_path
    else
      session[:email] = nil
      flash.now[:alert] = 'ログインできませんでした'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path, notice: 'ログアウトしました'
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
