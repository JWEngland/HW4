class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :places
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true
end
