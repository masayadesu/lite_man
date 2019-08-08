class Admin::UsersController < Admin::Base
  # before_action :authenticate_user, only: %i[index show edit update me]
  # before_action :authenticate_admin, only: %i[index show edit update]
  # before_action :correct_user, only: %i[show edit update]

  # before_action :authenticate_admin

  def index
    # @users = User.order("id")
    @users = User.order("id").page(params[:page])
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
      session[:user_id] = user.id
      flash[:notice] = "ユーザー登録が完了しました"
      # redirect_to admin_root_path
      redirect_to admin_users_path
    else
      flash[:error_messages] = user.errors.full_messages
      # binding.pry
      redirect_back fallback_location: user

    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.assign_attributes(user_params)
    # @user.update_attributes(user_params)
    # binding.pry
    if @user.save
      # redirect_to admin_root_path, notice: "ユーザー情報を編集しました"
      redirect_to admin_users_path, notice: "#{@user.name}さんのユーザー情報を編集しました"
      # binding.pry
    else
      flash[:error_messages] = user.errors.full_messages
      render "edit"
      # binding.pry
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