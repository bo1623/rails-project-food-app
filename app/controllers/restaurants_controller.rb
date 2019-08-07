class RestaurantsController < ApplicationController
  before_action :require_login, :require_manager, :current_user
  skip_before_action :require_manager, only: [:index, :show]

  def index #build in filter later on
    # if params[:location_id]
    #   @restaurants = Restaurant.where(location_id: params[:location_id])
    # else
    @restaurants = Restaurant.all
  end

  def show
    @restaurant=Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
  end

  def new
    @restaurant = Restaurant.new
    5.times do
      @restaurant.dishes.build
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @user.restaurant = @restaurant
    @user.save #need to find out why the user's restaurant_id doesnt update
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to new_restaurant_path
    end
  end

  def edit
    @restaurant=Restaurant.find(params[:id])
    @restaurant.dishes.build
  end

  def update
    @restaurant=Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine,:user_id, :location_id, :cuisine_id, :opening_time,:closing_time,:revenue,:rating, dish_ids:[], dishes_attributes: [:name,:price,:_destroy, :id])
  end

  def require_manager
    return head(:forbidden) unless User.find(session[:user_id]).restaurant_manager
  end


end
