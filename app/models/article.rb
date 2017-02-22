class Article < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true

  has_many :articlelists
  has_many :lists, through: :articlelists
end
