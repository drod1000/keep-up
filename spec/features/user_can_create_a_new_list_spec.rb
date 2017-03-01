require 'rails_helper'

describe "When a user visits user_lists index page"do
  context "authenticated user" do
    it "they can create a new list", js: true do
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

  context "unauthenticated user" do
    it "they do not have access to this page" do
      user = create(:user)

      visit user_lists_path(user)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
