class Api::V1::BaseController < ActionController::Base
  helper_method :current_user
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
