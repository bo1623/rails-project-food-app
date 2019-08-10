class SessionsController < ApplicationController

  def new
  end

  def omniauth
    session[:omniauth]=auth #saving the omniauth data to our session
    render 'sessions/omniauth'
  end

  def create
    if !session[:omniauth].nil? #if the user chose to log in via github
      omniauth_login
    else
      normal_login
    end
  end

  def destroy
    session.delete :user_id
    session.delete :omniauth
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def omniauth_login
    if User.exists?(uid: session[:omniauth]['uid']) #if we have a user that has logged in via github before
      @user = User.find_by(uid: session[:omniauth]['uid'])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to restaurants_path
      else
        flash[:message]="Invalid Password"
        render 'sessions/omniauth' #render if invalid password
      end
    else #if new user logging in via github, we need to create a new user
      @user = User.new(uid: session[:omniauth]['uid']) do |u|
        u.username = session[:omniauth]['info']['nickname']
        u.password = params[:password]
      end
      @user.save
      session[:user_id] = @user.id
      redirect_to restaurants_path
    end
  end

  def normal_login #if the user chooses to login via the normal way
    @user = User.find_by(username: params[:username])
    if !@user.nil? &&  User.exists?(@user.id) && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      if @user.restaurant_manager
        redirect_to new_restaurant_path and return
      else
        redirect_to restaurants_path and return
      end
    else
      render :new #rendering the log in page again after unsuccessful attempt
    end
  end

end
