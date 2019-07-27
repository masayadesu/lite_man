class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインしました"

      # redirect_to mypage_path
      redirect_to literatures_path
      # binding.pry
    else
      flash[:error_messages] = "ユーザー名またはパスワードが間違っています"
      redirect_back fallback_location: user
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
