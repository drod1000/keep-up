class UsersController < ApplicationController
  def show
    if current_user && params[:id].to_i == current_user.id
      render :show
    else
      render file: "/public/404"
    end
  end
end
