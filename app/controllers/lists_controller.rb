class ListsController < ApplicationController
  def index
    if current_user.id == params[:user_id].to_i
      render :index
    else
      render file: "/public/404"
    end
  end

  def show
    if current_user.id == params[:user_id].to_i
      @list = current_user.lists.find(params[:id])
    else
      render file: "/public/404"
    end
  end
end
