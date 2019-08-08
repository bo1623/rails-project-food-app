class MealsController < ApplicationController
  before_action :current_meal
  skip_before_action :current_meal, only: [:new, :create]

  def show
    @dishes=@meal.dishes
    @dish_names=@dishes.map{|dish| dish.name}.uniq
  end

  def new
    @restaurant=Restaurant.find(params[:restaurant_id])
    @dishes=@restaurant.dishes
    @meal=Meal.new(user_id: params[:user_id])
  end

  def create
    raise params.inspect
    if params[:dish_quantities].uniq == ['0'] #condition where all dish_quantites are 0
      redirect_back(fallback_location: root_path) #redirects back to previous page (restaurant show page)
    else
      @meal=Meal.new
      @user.meals << @meal
      params[:dish_ids].zip(params[:dish_quantities]).each do |id,quantity|
        quantity.to_i.times do #creating quantity times of meals_dish instances
          MealsDish.create(meal_id: @meal.id, dish_id: id) #creating new instances of meals_dishes
        end
      end
      redirect_to meal_path(@meal)
    end
  end


  # params from new meal form:
  #
  # {"meal"=>{"user_id"=>"4"},
  # "dish_quantities"=>["0", "0"],
  # "dish_ids"=>["1", "2"],
  # "commit"=>"Place your order",
  # "controller"=>"meals",
  # "action"=>"create"} permitted: false>}

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
