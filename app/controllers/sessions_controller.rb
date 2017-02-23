class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_oauth(oauth_data)
    session[:user_id] = @user.id
    redirect_to user_lists_path(@user)
  end

  def destroy
    reset_session
    flash[:success] = "Successfully logged out!"
    redirect_to root_path
  end

  private

  def oauth_data
    request.env["omniauth.auth"][:info].slice(:first_name, :last_name, :email)
  end
end
