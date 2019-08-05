class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  private
  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
    # binding.pry
  end

  def authenticate_user
    if @current_user == nil
      flash[:error_messages] = "ログインが必要です"
      redirect_to root_path
    end
  end
  # def authenticate_admin
  #   raise Forbidden unless @current_member&.administrator?
    # if  !@current_member&.administrator
    #   flash[:error_messages] = "権限がありません"
    #   redirect_to root_path
    # end
  # end
end
