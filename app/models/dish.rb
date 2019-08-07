class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :meals_dishes
  has_many :dishes, through: :meals_dishes
  has_many :users, through: :meals
end
