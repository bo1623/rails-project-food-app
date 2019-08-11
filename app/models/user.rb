class User < ApplicationRecord
  has_secure_password
  belongs_to :restaurant, optional: true
  has_many :meals
  has_many :dishes, through: :meals
  validates :username, presence: true
end
