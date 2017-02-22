class User < ApplicationRecord
  validates :email,
            :first_name,
            :last_name, presence: true
  validates :email, uniqueness: true

  has_many :lists
  has_many :articles, through: :lists
end
