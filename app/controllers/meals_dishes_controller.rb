class MealsDishesController < ApplicationController
  before_action :current_user

  def create
    if params[:dish_quantities].uniq == ['0']
      redirect_back(fallback_location: root_path) #redirects back to previous page (restaurant show page)
    else
      @meal=Meal.new
      @user.meals << @meal
      params[:dish_ids].zip(params[:dish_quantities]).each do |id,quantity|
        quantity.to_i.times do #creating quantity times of meals_dish instances
          MealsDish.create(meal_id: @meal.id, dish_id: id)
        end
      end
      redirect_to meal_path(@meal)
    end
  end

  def edit
  end


end
