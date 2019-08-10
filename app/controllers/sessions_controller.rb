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

    session[:user_id] = @user.id
    redirect_to root_path
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
    if User.exists?(uid: session[:omniauth]['uid'])
      @user = User.find_by(uid: session[:omniauth]['uid'])
      if @user.authenticate(params[:password])
        redirect_to restaurants_path
      else
        render 'sessions/omniauth' #render if invalid password
      end
    else
      @user = User.new(uid: session[:omniauth]['uid']) do |u|
        u.username = session[:omniauth]['info']['nickname']
        u.password = params[:password]
      end
      @user.save
    end
  end

  def normal_login
    @user = User.find_by(username: params[:username])
    if !@user.nil? &&  User.exists?(@user.id) && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      if @user.restaurant_manager
        redirect_to new_restaurant_path
      else
        redirect_to restaurants_path
      end
    else
      render :new #rendering the log in page again after unsuccessful attempt
    end
  end

end
