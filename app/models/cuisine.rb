class Cuisine < ApplicationRecord

  has_many :restaurants
  has_many :dishes, through: :restaurants
  has_many :meals, through: :restaurants

  validates :name, presence: true

end
