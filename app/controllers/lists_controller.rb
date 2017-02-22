class ListsController < ApplicationController
  def index
    @user = User.find(params["user_id"])
    @list = List.new(user_id: @user.id)
  end
end
