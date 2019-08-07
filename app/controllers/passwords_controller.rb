class PasswordsController < ApplicationController
  before_action :authenticate_user

  def show
    redirect_to :account
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    current_password = params[:account][:current_password]
    # current_password = account_params[:current_password]
    if current_password.present?
      if @user.authenticate(current_password)
        # @user.assign_attributes(params[:account])
        @user.assign_attributes(account_params)
        if @user.save
          redirect_to :account, notice: "パスワードを変更しました。"
        else
          render "edit"
        end
      else
        flash[:error_messages] = @user.errors.add(:current_password, :wrong)
        # flash[:error_message] = @user.errors.add(:current_password, "現在のパスワードが違います")
        redirect_back fallback_location: @user
        # render "edit"
      end
    else
      flash[:error_messages] = @user.errors.add(:current_password, :empty)
      # flash[:error_message] = @user.errors.add(:current_password, "現在のパスワードを入力してください")
      redirect_back fallback_location: @user
      # render "edit"
    end
  end

  private
  def account_params
  params.require(:account).permit(
      :current_password,
      :password,
      :password_confirmation)
  end

end
