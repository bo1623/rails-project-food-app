class MealsDishesController < ApplicationController

  def create
    raise params.inspect
    @meal=Meal.new
    @user=User.find(session[:user_id])
    @user.meals << @meal
  end

  private

  def meals_dishes_params
    params.require(:meals_dish).permit(:meal_id,:dish_id,:meal_dish_rating)
  end


end
