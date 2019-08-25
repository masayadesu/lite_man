class UsersController < ApplicationController

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to account_path
    else
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: user
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :administrator, :password, :password_confirmation)
  end
end
