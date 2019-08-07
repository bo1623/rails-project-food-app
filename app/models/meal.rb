class Meal < ApplicationRecord
  belongs_to :user
  has_many :meals_dishes
  has_many :dishes, through: :meals_dishes
end
