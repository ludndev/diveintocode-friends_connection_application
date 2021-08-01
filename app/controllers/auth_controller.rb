class AuthController < ApplicationController
  include AuthHelper
  
  before_action :guest_only, only: %i[signup login post_login post_signup]
  before_action :auth_only, only: [:profile]
  before_action :current_user, only: [:profile]

  def welcome

  end

  def profile

  end

  def signup

  end

  def login

  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, success: "You are log out"
  end

  # --- post

  def post_signup
    data = params.require(:auth).permit(:firstname, :lastname, :username, :password)

    @user = User.new(firstname: data[:firstname], lastname: data[:lastname], username: data[:username], password: data[:password])

    if @user.valid?
      if @user.save
        session[:user_id] = @user.id
        redirect_to auth_profile_path, success: "You have sign up successfully."
      else
        redirect_to auth_signup_path, warning: "Unable to register your account. Try again or contact an administrator."
      end
    else
      redirect_to auth_signup_path, danger: "Some information you filed is not valid. Try again !"
    end
  end

  def post_login
    data = params.require(:auth).permit(:username, :password)

    @user = User.find_by(username: data[:username])

    if !!@user && @user.authenticate(data[:password])
      session[:user_id] = @user.id
      redirect_to auth_profile_path, success: "Welcome <b>#{@user.username}</b> !"
    else
      message = "Something went wrong! Make sure your username and password are correct."
      redirect_to auth_login_path, warning: message
    end
  end

end
