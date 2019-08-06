class RestaurantsController < ApplicationController

  def index #build in filter later on
    # if params[:location_id]
    #   @restaurants = Restaurant.where(location_id: params[:location_id])
    # else
    @restaurants = Restaurant.all
  end

  def show
    @restaurant=Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.meals.build
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to new_restaurant_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :corporation_id,:location_id,:opening_time,:closing_time,:revenue,:rating, meal_ids:[], meals_attributes: [:name,:price,:restaurant_id,:user_id,:rating])
  end


end
