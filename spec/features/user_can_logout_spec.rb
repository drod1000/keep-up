require 'rails_helper'

describe "A logged in user" do
  it "can log out" do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit profile_path(user)
    expect(page).to have_content("Logout")
  end
end
