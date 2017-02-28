require 'rails_helper'

describe "When a user visits user_list show page", js: true do
  it "they can create a new article" do
    VCR.use_cassette("user_creates_article") do
      user = create(:user)
      list = create(:list, user: user)
      url = "http://www.bbc.com/future/story/20150402-the-worst-place-on-earth"
      page.set_rack_session(user_id: user.id)

      visit user_list_path(user.id, list.id)

      fill_in 'article', :with => url
      click_on("Add Article")

      sleep 2

      expect(current_path).to eq(user_list_path(user.id, list.id))
      expect(page).to have_content("The dystopian lake filled by the world’s tech lust")
    end
  end
end
