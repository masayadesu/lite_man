class AccountsController < ApplicationController
  # before_action :authenticate_user, only: %i[show edit ]
  # before_action :current_user
  before_action :authenticate_user
  before_action :set_target_account

  def show
  end

  def edit
  end

  def update
    # binding.pry
    # @user.assign_attributes(account_params)
    @user.update(account_params)
    # binding.pry
    if @user.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      # binding.pry
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to @user, notice: "ユーザーを削除しました"
  end

  private
  def account_params
    params.require(:account).permit(:name, :email)
  end

  def set_target_account
    @user = @current_user
  end
end
