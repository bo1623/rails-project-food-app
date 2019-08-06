class RestaurantsController < ApplicationController

  def index
    # if params[:location_id]
    #   @restaurants = Restaurant.where(location_id: params[:location_id])
    # else
    @restaurants = Restaurant.all
  end




end
