class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
