require 'rails_helper'

describe "When a user visits user_list show page" do
  context "authenticated user" do
    it "they can create a new article", js: true do
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

    context "article already exists" do
      it "article will be added to list without API call", js: true do
        user = create(:user)
        list = create(:list, user: user)
        article = create(:article)

        page.set_rack_session(user_id: user.id)

        visit user_list_path(user.id, list.id)

        fill_in 'article', :with => article.url
        click_on("Add Article")

        sleep 2

        expect(current_path).to eq(user_list_path(user.id, list.id))
        expect(page).to have_content(article.title)
        expect(Article.count).to eq(1)
      end
    end
  end

  context "unauthenticated user" do
    it "they do not have access to this page" do
      user = create(:user)
      list = create(:list, user: user)

      visit user_list_path(user, list)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
