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
    @user.assign_attributes(account_params)
    if @user.save
      redirect_to :account, notice: "#{@user.name}さんのアカウント情報を更新しました。"
    else
      # flash[:notice] = @user.errors.full_messages
      flash[:error_messages] = @user.errors.full_messages
      # binding.pry
      redirect_to action: 'edit'
      # render :root
      # redirect_to :root
    end
  end
  # flash.now[:error_messages] = @user.errors.full_messages
  # flash[:error_messages] = @user.errors.full_messages
  # flash[:error_message] = "flash表示される"
  # flash[:error_messages] = @user.errors.add
  # flash[:error_messages] = @user.errors.full_messages
  # flash[:error_messages] = @user.errors.messages

  # render "edit"
  # render @user.errors.full_messages
  # render @user.errors.messages

  def destroy
    @user.destroy
    flash[:error_message] = "登録を解除しました"
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
