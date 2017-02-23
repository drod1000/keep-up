require 'rails_helper'

describe "A logged in user" do
  it "can log out" do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit user_path(user)

    expect(page).to have_content("Logged in as #{user.first_name}")
    expect(page).to have_content("Logout")
    click_on("Logout")

    expect(page).to_not have_content("Logged in as #{user.first_name}")
    expect(page).to_not have_content("Logout")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Successfully logged out")
  end
end
