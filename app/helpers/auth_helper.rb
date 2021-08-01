module AuthHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end

  def auth_only
    redirect_to auth_login_path, warning: "You should login first" unless logged_in?
  end

  def guest_only
    redirect_to auth_profile_path, warning: "You are already login" if logged_in?
  end
end
