require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a url" do
        article = Article.new

        expect(article).to be_invalid
      end

      it "has a unique url" do
        url = "www.something.com/something"
        article_1 = Article.create(url: url)
        article_2 = Article.new(url: url)

        expect(article_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with only a url" do
        url = "www.something.com/something"
        article = Article.new(url: url)

        expect(article).to be_valid
      end
    end
  end

  describe "associations" do
    it "has many listarticles" do
      article = create(:article)

      expect(article).to respond_to(:list_articles)
    end

    it "has many lists" do
      article = create(:article)

      expect(article).to respond_to(:lists)
    end
  end

  describe "methods" do
    context ".create_with_aylien" do
      it "creates an article with text given url" do
        VCR.use_cassette("create article from Aylien Service") do
          url = "http://www.si.com/nba/2017/02/22/nba-trade-deadline-burning-questions-jimmy-butler-celtics-bulls"
          list = create(:list)
          article = Article.create_with_aylien(list, url)

          expect(article).to be_an(Article)
          expect(article.title).not_to be_empty
          expect(article.author).not_to be_empty
          expect(article.body).not_to be_empty
        end
      end
    end
  end

end
