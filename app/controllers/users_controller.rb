class UsersController < ApplicationController
  def show
    if current_user.id == params[:id].to_i
      render :show
    else
      render file: "/public/404"
    end
  end
end
