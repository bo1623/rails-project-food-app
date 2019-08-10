class WelcomeController < ApplicationController

  def home
    @restaurants=Restaurant.where.not(restaurant_rating: nil).order(restaurant_rating: :desc)[0..4]
  end

end
