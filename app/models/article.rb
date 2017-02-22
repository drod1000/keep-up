class Article < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true

  has_many :listarticles
  has_many :lists, through: :listarticles

end
