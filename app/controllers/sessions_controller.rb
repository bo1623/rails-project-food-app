class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !@user.nil? &&  User.exists?(@user.id) && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to restaurants_path
    else
      render :new #rendering the log in page again after unsuccessful attempt
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
