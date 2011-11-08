class ApplicationController < ActionController::Base
  protect_from_forgery
  
private

  def authenticate!
    unless current_user
      store_location
      redirect_to sign_in_path
    end
  end
  helper_method :authenticate!
    
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def store_location
    session[:return_to] = request.fullpath
  end
end
