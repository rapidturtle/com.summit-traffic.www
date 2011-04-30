class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :authenticate!, :current_user
  
  private
  
  def authenticate!
    unless current_user
      store_location
      redirect_to sign_in_path
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end
end
