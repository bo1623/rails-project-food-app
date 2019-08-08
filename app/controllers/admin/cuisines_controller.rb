class Admin::CuisinesController < ApplicationController

  def new
    @cuisine=Cuisine.new
  end

  def create
    if Cuisine.exists?(name: params[:cuisine][:name])
    @cuisine = Cuisine.find_or_create_by(name: params[:cuisine][:name])
    redirect_to cuisines_path
  end

  def edit
    @cuisine=Cuisine.find(params[:id])
  end




end
