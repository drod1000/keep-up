class Api::V1::ListsController < Api::V1::BaseController
  helper_method :current_user
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def create
    @list = current_user.lists.create(name: params[:list_name])
    render json: @list, :status => 201
  end
end
