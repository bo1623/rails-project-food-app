class User < ApplicationRecord
  has_secure_password
  has_many :meals
  has_many :restaurants, through: :meals
  has_many :corporations, through: :restaurants
  has_many :locations, through: :restaurants

  validates :username, presence: true

end
