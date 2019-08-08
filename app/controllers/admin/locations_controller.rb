class Admin::LocationsController < ApplicationController

  def new
    @location=Location.new
  end

  def create
    if !Location.exists?(name: params[:location][:name])
      @location=Location.new(name: params[:location][:name])
      if @location.save
        redirect_to location_path(@location)
      else
        render :new #if the location was invalid
      end
    else
      flash[:message]="Location already exists"
      redirect_to locations_path #if the location with that name already exists
    end
  end

  def edit
    @location=Location.find(params[:id])
  end

  def update
    @location=Location.find(params[:id])
    @location.update(location_params)
    redirect_to location_path(@location)
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end


end
