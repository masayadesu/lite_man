class PasswordsController < ApplicationController
  before_action :authenticate_user

  def show
    # redirect_to :account
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    return if @user.id == 1
    current_password = params[:account][:current_password]
    if current_password.present?
      if @user.authenticate(current_password)
        @user.assign_attributes(account_params)
        if @user.save
          redirect_to :account, notice: "パスワードを変更しました"
        else
          flash[:error_messages] = @user.errors.full_messages
          render "edit"
        end
      else
        flash[:error_messages] = @user.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      flash[:error_messages] = @user.errors.add(:current_password, :empty)
      render "edit"
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
