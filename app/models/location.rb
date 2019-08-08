class Location < ApplicationRecord
  has_many :restaurants
  has_many :dishes, through: :restaurants
  has_many :meals, through: :dishes
  has_many :users, through: :meals

  validates :name, presence: true
end
