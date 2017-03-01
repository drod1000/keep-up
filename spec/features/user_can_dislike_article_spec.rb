require 'rails_helper'

describe "When a user visits user_list show page", js: true do
  it "they can dislike an article" do
    user = create(:user)
    list = create(:list, user: user)
    list.articles << create(:article)

    page.set_rack_session(user_id: user.id)

    visit user_list_path(user.id, list.id)

    click_on("Dislike")

    sleep 2

    expect(current_path).to eq(user_list_path(user.id, list.id))

    within("tr:nth-of-type(2)") do
      within("td:nth-of-type(2)") do
        expect(page).to have_content("-1")
      end
    end
  end
end
