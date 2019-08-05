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
    @user.assign_attributes(params[:account])
    if @user.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to @user, notice: "ユーザーを削除しました"
  end

  private
  def set_target_account
    @user = @current_user
  end
end
