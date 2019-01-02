class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
  before_action :require_login
  def current_user
    User.find(session[:userid])
  end

  helper_method :current_user

  def require_login
    redirect_to "/" unless  session[:userid]
  end
end
