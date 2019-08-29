class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  class LoginRequired < StandardError; end
  class Forbidden < StandardError; end

  if Rails.env.production? || ENV["RESCUE_EXCEPTIONS"]
   rescue_from StandardError, with: :rescue_internal_server_error
   rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
   rescue_from ActionController::ParameterMissing, with: :rescue_bad_request
  end

  rescue_from LoginRequired, with: :rescue_login_required
  rescue_from Forbidden, with: :rescue_forbidden

  private
  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:error_message] = "ログインが必要です"
      redirect_to :login
    end
  end

  def first_admin?
    if @user.id == 1
      flash[:error_message] = "このアカウントを削除する事はできません"
      redirect_back(fallback_location: request.fullpath)
    end
  end

  def rescue_bad_request(exception)
    render "errors/bad_request", status: 400, layout: "error",
      formats: [:html]
  end

  def rescue_login_required(exception)
    render "errors/login_required", status: 403, layout: "error",
      formats: [:html]
  end

  def rescue_forbidden(exception)
  render "errors/forbidden", status: 403, layout: "error",
    formats: [:html]
  end

  def rescue_not_found(exception)
    render "errors/not_found", status: 404, layout: "error",
      formats: [:html]
  end

  def rescue_internal_server_error(exception)
    render "errors/internal_server_error", status: 500, layout: "error",
      formats: [:html]
  end

end
