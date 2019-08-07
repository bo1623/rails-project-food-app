class MealsController < ApplicationController

  def show
    @meal=Meal.find(params[:id])
    @dishes=@meal.dishes
    @dish_names=@dishes.map{|dish| dish.name}.uniq
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    raise params.inspect
  end

  def destroy
    @meal=Meal.find(params[:id])
    @restaurant=@meal.dishes[0].restaurant
    @meal.destroy

    redirect_to restaurant_path(@restaurant)
  end


end
