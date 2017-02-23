class Article < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true

  has_many :listarticles
  has_many :lists, through: :listarticles

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
