class ListsController < ApplicationController
  def index
    if current_user && params[:user_id].to_i == current_user.id
      render :index
    else
      render file: "/public/404"
    end
  end

  def show
    if current_user && params[:user_id].to_i == current_user.id
      @list = current_user.lists.find(params[:id])
    else
      render file: "/public/404"
    end
  end
end
