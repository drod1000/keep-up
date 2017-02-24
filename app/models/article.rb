class Article < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true

  has_many :list_articles
  has_many :lists, through: :list_articles

  def self.create_with_aylien(url)
    article = Article.create(url: url)
    attributes = AylienService.extract(url)
    article.update(title: attributes[:title])
    article.update(author: attributes[:author])
    article.update(body: attributes[:article])
    article.save
    article
  end
end
