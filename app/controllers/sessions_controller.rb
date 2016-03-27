class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_url
  	else
  		redirect_to :action => 'new', notice: 'Your user name or password was not found or did not match our records.'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
