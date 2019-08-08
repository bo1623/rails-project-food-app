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

  def dish_names
    dishes=self.dishes
    dishes.map{|dish| dish.name}.uniq
  end

  def update_dish_rating
    dishes=self.dishes.uniq
    dishes.each do |dish|
      meals_dishes = MealsDish.where(dish_id: dish.id).where.not(meal_dish_rating: nil)
      meals_dish_ratings= meals_dishes.map{|meals_dish| meals_dish.meal_dish_rating}
      dish.dish_rating=(meals_dish_ratings.sum/meals_dish_ratings.size).to_i
      dish.save
    end
  end


end
