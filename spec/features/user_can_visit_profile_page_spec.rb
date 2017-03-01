require 'rails_helper'

describe "When a user visits their profile" do
  context "authenticated user" do
    it "they can see their information" do
      user = create(:user)

      page.set_rack_session(user_id: user.id)

      visit user_path(user)

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("First Name: #{user.first_name}")
      expect(page).to have_content("Last Name: #{user.last_name}")
      expect(page).to have_content("Last Name: #{user.last_name}")
      expect(page).to have_content("Email: #{user.email}")
    end
  end

  context "unauthenticated user" do
    it "they do not have access to this page" do
      user = create(:user)

      visit user_path(user)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
