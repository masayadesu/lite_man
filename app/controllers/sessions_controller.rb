class SessionsController < ApplicationController
  before_action :forbid_login_user , {only: %i[create]}

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインしました"
      redirect_to literatures_path
      # binding.pry
    else
      flash[:error_messages] = "ユーザー名またはパスワードが間違っています"
      redirect_back fallback_location: user
    end
  end

  def destroy
    session.delete(:user_id)
    # flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end

  private
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to literatures_path
    end
  end
end
