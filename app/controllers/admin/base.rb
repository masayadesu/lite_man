class Admin::Base < ApplicationController
  before_action :authenticate_admin

  private
  def authenticate_admin
    raise Forbidden unless @current_user&.administrator?
    # if  !@current_member&.administrator
      # flash[:error_messages] = "権限がありません"
      # redirect_to root_path
    # end
  end
end
