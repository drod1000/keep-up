class Api::V1::ListsController < ActionController::Base
  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.create(name: params[:list_name])
    render json: @list, :status => 201
  end
end
