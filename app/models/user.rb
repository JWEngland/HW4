class User < ApplicationRecord
  # Attributes
  attr_accessor :first_name, :last_name, :email, :password

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  # Associations, Methods, etc.
end
