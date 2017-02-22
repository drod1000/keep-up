class ListsController < ApplicationController
  def index
    if current_user.id == params[:user_id].to_i
      @list = List.new(user_id: current_user.id)
      render :index
    else
      render file: "/public/404"
    end
  end
end
