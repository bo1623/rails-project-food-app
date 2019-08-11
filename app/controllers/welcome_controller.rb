class WelcomeController < ApplicationController

  def home
    if session[:user_id]
      @user=User.find(session[:user_id])
    end
    @restaurants=Restaurant.where.not(restaurant_rating: nil).order(restaurant_rating: :desc)[0..4]
  end

end
