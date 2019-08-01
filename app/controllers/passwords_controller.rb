class PasswordsController < ApplicationController
  before_action :authenticate_user

  def show
    redirect_to :account
  end

  def edit
    @user = current_user
  end

end
