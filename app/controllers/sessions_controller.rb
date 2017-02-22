class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_oauth(oauth_data)
    session[:user_id] = @user.id
    redirect_to user_lists_path(@user)
  end

  private

  def oauth_data
    request.env["omniauth.auth"][:info].slice(:first_name, :last_name, :email)
  end
end
