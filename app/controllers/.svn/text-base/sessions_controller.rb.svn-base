class SessionsController < ApplicationController
  def show
    redirect_to "/home"
  end

  def new
    @page_title = "InMusic.org"
  end
    
  def create
    session[:password] = params[:password]
    flash[:notice] = 'Successfully logged in.'
    redirect_to home_path
  end
  
  def destroy
    reset_session
    flash[:notice] = 'Successfully logged out.' 
    redirect_to login_path
  end
end
