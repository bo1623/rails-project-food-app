class WelcomeController < ApplicationController

  def home
    @restaurants=Restaurant.all
  end

end
