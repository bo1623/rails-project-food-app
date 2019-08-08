class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :meals, through: :dishes
  # has_many :users, through: :meals
  belongs_to :location
  belongs_to :cuisine
  accepts_nested_attributes_for :dishes, allow_destroy: true, update_only: true, reject_if: proc{|attributes| attributes[:name].blank?}

  def weighted_rating(dishes)
    rating=0
    dishes.each do |dish|
      rating+=MealsDish.where(dish_id: dish.id).size*dish.dish_rating
    end
    dish_ids = self.dishes.map{|dish| dish.id}
    self.restaurant_rating = rating/MealsDish.where(dish_id: dish_ids).size
    self.save
  end

end
