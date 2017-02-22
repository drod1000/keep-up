class SessionsController < ApplicationController
  def create
    User.find_or_create_by_oauth(oauth_data)
  end

  private

  def oauth_data
    request.env["omniauth.auth"][:info].slice(:first_name, :last_name, :email)
  end
end
