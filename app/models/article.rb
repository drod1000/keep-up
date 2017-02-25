class Article < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true

  has_many :list_articles, dependent: :destroy
  has_many :lists, through: :list_articles

  def self.create_with_aylien(list, url)
    article = list.articles.create(url: url)
    attributes = AylienService.extract(url)
    article.update(title: attributes[:title])
    article.update(author: attributes[:author])
    article.update(body: attributes[:article].gsub!("\n",''))
    article.save
    article
  end

  def convert_to_speech
    mp3s = body.scan(/.{1,2950}/).map do |piece|
      AwsService.text_to_speech(piece).audio_stream
    end
  end

  def self.combine_mp3s(mp3s)
    mp3s.inject("") do |sum, mp3|
      sum += mp3.string
      return sum
    end
  end
end
