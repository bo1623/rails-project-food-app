class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :meals
  has_many :users, through: :meals
end
