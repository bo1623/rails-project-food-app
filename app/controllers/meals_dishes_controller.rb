class MealsDishesController < ApplicationController
  before_action :current_user

  def create
    @meal=Meal.new
    @user.meals << @meal
    @meals_dish = MealsDish.new(meals_dishes_params)
    @meals_dish.meal = @meal
    if @meals_dish.save
      redirect_to meal_path(@meal)
    else
      redirect_back
    end
  end

  private

  def meals_dishes_params
    params.permit(:meal_id,:dish_id,:meal_dish_rating)
  end


end
