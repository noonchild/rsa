class AccountController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  # If you want "remember me" functionality, add this before_filter to Application Controller
  # before_filter :login_from_cookie
  #before_filter :login_required
  
  def index
    redirect_to(:action => 'session')
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_to(:controller => 'session' )
  end
  

end
