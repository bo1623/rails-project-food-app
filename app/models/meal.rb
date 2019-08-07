class Meal < ApplicationRecord
  belongs_to :user
  has_many :meals_dishes
  has_many :dishes, through: :meals_dishes

  def total
    dishes=self.dishes
    dishes.map{|dish| dish.price}.sum
  end

  def dish_price(dish_name)
    dishes=self.dishes.where(name: dish_name)
    dishes[0].price
  end

  def dish_count(dish_name)
    dishes=self.dishes.where(name: dish_name).count
  end

  def dishes_cost(dish_name)
    dish_price(dish_name)*dish_count(dish_name)
  end


end
