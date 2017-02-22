class List < ApplicationRecord
  validates :name, presence: true

  has_many :listarticles
  has_many :articles, through: :listarticles
  belongs_to :user
end
