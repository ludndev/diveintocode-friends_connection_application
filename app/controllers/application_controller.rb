class ApplicationController < ActionController::Base
  include AuthHelper

  add_flash_types :primary, :secondary, :success, :danger, :warning, :info

  before_action :guest_only, only: [:signup, :login, :post_login, :post_signup]
  before_action :auth_only, only: [:profile]
  before_action :current_user, only: [:profile]

end
