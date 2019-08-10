class WelcomeController < ApplicationController

  def home
    Restaurant.order(restaurant_rating: :desc)
    @restaurants=Restaurant.all[0...4]
  end

end
