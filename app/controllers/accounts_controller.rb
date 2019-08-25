class AccountsController < ApplicationController
  before_action :authenticate_user
  before_action :set_target_account
  before_action :is_administrator_last_one?, only: %i[destroy]

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
    @user.transaction do
      @user.destroy
      user = User.where(administrator: "true").count
      if user == 0
        flash[:error_message] = "このアカウントを削除する事ができませんでした。<br>
                                  管理者は1人以上、必要です。<br>
                                  このアカウントを削除したい時は、他のユーザーに管理者権限を付与後に、
                                  削除することができます。 "
        raise ActiveRecord::Rollback
      else
        flash[:notice] = "#{@user.name}さんの登録を解除しました。"
        redirect_to :root
      end
      return
    end
    redirect_to :account
  end

  private
  def account_params
    params.require(:account).permit(:name, :email)
  end

  def set_target_account
    @user = @current_user
  end
end
