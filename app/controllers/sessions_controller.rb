class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.username
      redirect_to root_path, notice: 'ログインしました'
    else
      session[:email] = nil
      render :new, notice: 'ログインできませんでした'
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
