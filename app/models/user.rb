class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :lists
  has_many :articles, through: :lists
end
