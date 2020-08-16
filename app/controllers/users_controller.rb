class UsersController < ApplicationController
  def new
    if session[:user_id]
      flash[:alert] = "すでにログインしています"
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      session[:user_name]=@user.username
      redirect_to root_path
    else
      flash.now[:alert] = "必須項目を入力してください"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
