class Place < ApplicationRecord
  has_one_attached :image
  has_many :posts

  validates :name, presence: true
  validates :description, presence: true

end
