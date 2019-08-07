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
        @user.assign_attributes(account_params)
        if @user.save
          redirect_to :account, notice: "パスワードを変更しました。"
        else
          flash[:error_messages] = @user.errors.full_messages
          render "edit"
        end
      else
        flash[:error_messages] = @user.errors.add(:current_password, :wrong)
        flash[:error_messages] = @user.errors.full_messages
        render "edit"
      end
    else
      flash[:error_messages] = @user.errors.add(:current_password, :empty)
      flash[:error_messages] = @user.errors.full_messages
      render "edit"
    end
    # flash[:error_messages] = @user.errors.full_messages
  end

  private
  def account_params
  params.require(:account).permit(
      :current_password,
      :password,
      :password_confirmation)
  end

end
