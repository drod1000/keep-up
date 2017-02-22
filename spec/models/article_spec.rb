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

      expect(article).to respond_to(:listarticles)
    end

    it "has many lists" do
      article = create(:article)

      expect(article).to respond_to(:lists)
    end
  end

end
