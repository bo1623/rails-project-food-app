class User < ApplicationRecord
  has_secure_password
  belongs_to :restaurant
  has_many :meals
  has_many :dishes, through: :meals
  # has_many :restaurants, through: :dishes
  # has_many :locations, through: :restaurants


  validates :username, presence: true


end
