class SessionsController < ApplicationController
  def new
    session[:return_to] = request.referer
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      uri = session[:return_to]
      session[:return_to] = nil
      flash[:notice] = "Signed in!"
      redirect_to uri rescue redirect_to root_path
    else
      flash.now.alert = "Incorrect email address or password."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out!"
    redirect_to request.referer rescue redirect_to root_path
  end
end
