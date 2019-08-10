class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      if @user.restaurant_manager
        redirect_to new_restaurant_path
      else
        redirect_to restaurants_path
      end
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :username, :admin, :restaurant_manager, :restaurant_id)
  end



end
