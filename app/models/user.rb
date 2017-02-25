class User < ApplicationRecord
  validates :email,
            :first_name,
            :last_name, presence: true
  validates :email, uniqueness: true

  has_many :lists, dependent: :destroy
  has_many :articles, through: :lists

  def self.find_or_create_by_oauth(oauth_data)
    user = User.find_by(email: oauth_data[:email])
    return user if user
    user = User.new
    user.email = oauth_data[:email]
    user.first_name = oauth_data[:first_name]
    user.last_name = oauth_data[:last_name]
    user.save
    user
  end
end
