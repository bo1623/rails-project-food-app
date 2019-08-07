class MealsController < ApplicationController
  before_action :current_meal

  def show
    @dishes=@meal.dishes
    @dish_names=@dishes.map{|dish| dish.name}.uniq
  end

  def edit
  end

  def update
    params[:names].zip(params[:dish_ratings]).each do |name, rating|
      meals_dishes=MealsDish.where(meal_id: @meal.id, dish_id: Dish.find_by(name: name).id)
      meals_dishes.each do |meals_dish|
        meals_dish.meal_dish_rating=rating
        meals_dish.save
      end
    end
    redirect_to root_path
  end

  # params hash from meals/edit.html.erb
  # {"dish_ratings"=>["4", "3"],
  #   "names"=>["Green Tea Latte", "Flat White"],
  #   "commit"=>"Submit Ratings",
  #   "controller"=>"meals", "action"=>"update",
  #   "id"=>"16"}

  def destroy
    @restaurant=@meal.dishes[0].restaurant
    @meal.destroy

    redirect_to restaurant_path(@restaurant)
  end

  private

  def current_meal
    @meal=Meal.find(params[:id])
  end


end
