class List < ApplicationRecord
  validates :name, presence: true

  has_many :list_articles
  has_many :articles, through: :list_articles
  belongs_to :user
end
