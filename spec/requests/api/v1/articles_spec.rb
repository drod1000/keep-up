require 'rails_helper'

describe "Articles API" do
  it "can create an article" do
    VCR.use_cassette("create_article from API endpoint") do
      user = create(:user)
      list = create(:list, user: user)
      url = "http://www.bbc.com/future/story/20170223-chinas-zombie-factories-and-unborn-cities"
      allow_any_instance_of(Api::V1::ArticlesController).to receive(:current_user).and_return(user)

      post "/api/v1/articles?list_id=#{list.id}&url=#{url}"

      expect(response).to be_success
      expect(response.status).to eq(201)

      expect(Article.count).to eq(1)
      expect(user.articles.count).to eq(1)

      created_article = user.articles.first

      expect(created_article.url).to eq(url)
    end
  end

  it "can like an article" do
    user = create(:user)
    article = create(:article)

    allow_any_instance_of(Api::V1::ArticlesController).to receive(:current_user).and_return(user)

    post "/api/v1/articles/#{article.id}/liked"

    expect(response).to be_success

    expect(article.votes_for.count).to eq(1)
    expect(user.voted_for? article).to be_truthy
  end
end
