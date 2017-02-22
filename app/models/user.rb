class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :lists
  has_many :articles, through: :lists
end
