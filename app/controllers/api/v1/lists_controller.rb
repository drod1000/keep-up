class Api::V1::ListsController < Api::V1::BaseController
  def create
    @list = current_user.lists.create(name: params[:list_name])
    render json: @list, :status => 201
  end
end
