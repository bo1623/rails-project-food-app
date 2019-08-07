class MealsController < ApplicationController

  def show
    @meal=Meal.find(params[:id])
    @dishes=@meal.dishes
    @dish_names=@dishes.map{|dish| dish.name}.uniq
  end

end
