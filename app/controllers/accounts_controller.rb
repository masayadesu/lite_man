class AccountsController < ApplicationController
  # before_action :authenticate_user, only: %i[show edit ]
  before_action :authenticate_user

  def show
    @user = @current_user
  end

  def edit
    @user = @current_member
  end

  def update
    @user = @current_member
    @user.assign_attributes(params[:account])
    if @user.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end
end
