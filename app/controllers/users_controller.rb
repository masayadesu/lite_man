class UsersController < ApplicationController
  before_action :authenticate_user, {only: %i[index, show, edit, update]}


  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to literatures_path
    else
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: user
      # binding.pry
    end
  end

  def me
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
