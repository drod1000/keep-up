require 'rails_helper'

RSpec.describe ListArticle, type: :model do
  describe "associations" do
    it "belongs to a list" do
      list_article = create(:list_article)

      expect(list_article).to respond_to(:list)
    end

    it "belongs to an article" do
      list_article = create(:list_article)

      expect(list_article).to respond_to(:article)
    end
  end
end
