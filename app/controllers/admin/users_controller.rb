class Admin::UsersController < Admin::Base

  def index
    @users = User.page(params[:page]).per(10).order("id")
  end

  def search
    @users = User.search(params[:q]).page(params[:page]).order("id")
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
      redirect_to admin_user_path(user)
    else
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: user
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to admin_user_path, notice: "#{@user.name}さんのユーザー情報を編集しました"
    else
      flash[:error_messages] = @user.errors.full_messages
      # render "edit"
      redirect_to action: 'edit'
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
