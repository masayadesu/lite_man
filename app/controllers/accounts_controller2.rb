class AccountsController < ApplicationController
  before_action :authenticate_user
  before_action :set_target_account
  before_action :is_administrator_last_one, only: %i[destroy]

  def show
  end

  def edit
  end

  def update
    @user.assign_attributes(account_params)
    if @user.save
      flash[:notice] = "#{@user.name}さんのアカウント情報を更新しました。"
      redirect_to :account
    else
      flash[:error_messages] = @user.errors.full_messages
      redirect_to action: 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:error_message] = "登録を解除しました。"
    redirect_to :root
  end

  private
  def account_params
    params.require(:account).permit(:name, :email)
  end

  def set_target_account
    @user = @current_user
  end
end
