class Admin::UsersController < Admin::Base
  before_action :set_target_user, only: %i[show edit update destroy]
  before_action :first_admin?, only: %i[destroy]

  def index
    @users = User.page(params[:page]).per(10).order("id")
  end

  def search
    @users = User.search(params[:q]).page(params[:page]).order("id")
    render "index"
  end

  def show
  end

  def new
    @user = User.new(flash[:user])
  end

  def edit
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to admin_user_path(user)
    else
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: user
    end
  end

  def update
    return if @user.id == 1
    @user.assign_attributes(user_params)
    if @user.save
      flash[:notice] = "#{@user.name}さんのユーザー情報を編集しました。"
      redirect_to admin_user_path(@user)
    else
      flash[:error_messages] = @user.errors.full_messages
      redirect_to action: 'edit'
    end
  end

  def destroy
    @user.transaction do
      @user.destroy
      user = User.where(administrator: "true").count
      if user == 0
        flash[:error_message] = "このユーザーを削除する事ができませんでした。<br>
                                  管理者は1人以上、必要です。"
        raise ActiveRecord::Rollback
      else
        flash[:notice] = "#{@user.name}さんのアカウントを削除しました。"
      end
    end
    redirect_to :admin_users
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :administrator, :password, :password_confirmation)
  end

  def set_target_user
    @user = User.find(params[:id])
  end
end
