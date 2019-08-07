module ApplicationHelper

  def admin?
    @user=User.find(session[:user_id])
    @user.admin
  end

  def restaurant_manager?
    @user=User.find(session[:user_id])
    @user.restaurant_manager
  end

  def normal_user?
    @user=User.find(session[:user_id])
    !@user.admin && !@user.restaurant_manager
  end


end
