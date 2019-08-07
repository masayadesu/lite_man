class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[index search show edit update destroy]
  before_action :set_target_user, only: %i[show search edit update destroy]
  # before_action :authenticate_admin, except: %i[create]
  # before_action :correct_user, only: %i[show edit update]

  before_action :correct_user, only: %i[index search show edit update destroy]

  def index
    @users = User.order("id").page(params[:page])
  end

  def search
    @users = User.search(params[:q]).page(params[:page])
    render "index"
  end

  def show
  end

  def new
    @user = User.new(flash[:user])
  end
  def edit
    # @user = User.find(params[:id])
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

    end
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to account_path(@user), notice: "#{@user.name}さんのユーザー情報を編集しました"
    else
      flash[:error_messages] = user.errors.full_messages
      render "edit"
      # binding.pry
    end
  end
  def destroy
    # @user = User.find_by(id: params[:id])
    # @user = User.find(params[:id])
    @user.destroy
    redirect_to @user, notice: "ユーザーを削除しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :administrator, :password, :password_confirmation)
  end
  def set_target_user
    @user = User.find(params[:id])
  end
  def correct_user
    if @user.id != @current_user.id
      flash[:error_message] = "権限がありません"
      redirect_to literatures_path
    end
  end
end
