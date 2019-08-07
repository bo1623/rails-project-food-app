class Meal < ApplicationRecord
  belongs_to :user
  has_many :meals_dishes
  has_many :dishes, through: :meals_dishes

  def total
    dishes=self.dishes
    dishes.map{|dish| dish.price}.sum
  end

end
