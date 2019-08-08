class Admin::CuisinesController < ApplicationController

  def new
    @cuisine=Cuisine.new
  end

  def create
    if !Cuisine.exists?(name: params[:cuisine][:name])
      @cuisine=Cuisine.new(name: params[:cuisine][:name])
      if @cuisine.save
        redirect_to cuisine_path(@cuisine)
      else
        render :new #if the cuisine was invalid
      end
    else
      flash[:message]="Cuisine already exists"
      redirect_to cuisines_path #if the cuisine with that name already exists
    end
  end

  def edit
    @cuisine=Cuisine.find(params[:id])
  end




end
