class Article < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true

  has_many :list_articles, dependent: :destroy
  has_many :lists, through: :list_articles

  acts_as_votable

  def self.create_with_aylien(list, url)
    article = list.articles.create(url: url)
    attributes = AylienService.extract(url)
    article.update(title: attributes[:title])
    article.update(author: attributes[:author])
    article.update(body: TextToSpeech.clean_body(attributes[:article]))
    article.save
    article
  end

  def convert_to_speech
    TextToSpeech.convert(body)
  end

  def export_speech
    AwsService.export_to_s3(convert_to_speech, id.to_s)
  end
end
