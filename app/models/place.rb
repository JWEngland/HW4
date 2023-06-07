class Place < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true

end
