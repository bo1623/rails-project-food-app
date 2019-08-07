class ApplicationController < ActionController::Base

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
