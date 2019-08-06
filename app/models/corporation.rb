class Corporation < ApplicationRecord
  has_many :restaurants
  has_many :locations, through: :restaurants
  has_many :meals, through: :restaurants
  has_many :users, through: :meals
end
