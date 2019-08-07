class MealsController < ApplicationController

  def show
    @meal=Meal.find(params[:id])
    @dishes=@meal.dishes
  end

end
