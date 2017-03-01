require 'rails_helper'

describe "When a user visits user_lists index page", js: true do

  it "they can create a new list" do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit user_lists_path(user)

    fill_in 'list', :with => 'new list'
    click_on("Add List")

    sleep 2

    expect(current_path).to eq(user_lists_path(user))
    expect(page).to have_content('new list')
  end
end
