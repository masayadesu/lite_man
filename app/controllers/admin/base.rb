class Admin::Base < ApplicationController
  before_action :authenticate_admin

  private
  def authenticate_admin
    # raise Forbidden unless @current_user&.administrator?
    if  !@current_user&.administrator

      flash[:error_message] = "権限がありません"
      redirect_to literatures_path
    end
  end
end
