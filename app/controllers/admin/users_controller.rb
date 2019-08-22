class Admin::UsersController < Admin::Base
  # before_action :authenticate_user, only: %i[index show edit update me]
  # before_action :authenticate_admin, only: %i[index show edit update]
  # before_action :correct_user, only: %i[show edit update]

  # before_action :authenticate_admin

  def index
    # @users = User.order("id")
    @users = User.page(params[:page]).per(20).order("id")
    # @users = User.page(params[:page]).order("id")
  end

  def search
    @users = User.search(params[:q]).page(params[:page])
    render "index"
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(flash[:user])
  end
  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to admin_users_path
    else
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: user

    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "#{@user.name}さんのユーザー情報を編集しました"
    else
      flash[:error_messages] = user.errors.full_messages
      render "edit"
    end
  end
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "#{@user.name}さんのアカウントを削除しました"
  end





  private
  def user_params
    params.require(:user).permit(:name, :email, :administrator, :password, :password_confirmation)
  end
end
