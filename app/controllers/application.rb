# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #helper_method :url_for
  session :session_key => '_inmusic_session_id'
  include AuthenticatedSystem
  include Extras

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '66eee9b4bee3b55349bea234df78132d'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  helper_method :admin?
  
  def check_login
    if not admin?
      redirect_to login_path
    end
  end
  
  def get_fbid
    @fbid || session[:fbid]
  end
  
  
  def set_fbid_for_session(fbid)
    session[:fbid] = fbid
    @fbid = fbid
  end
  
  def get_fbid_from_session
    @fbid || session[:fbid]
  end
  
  protected
  
  def authorize
    unless admin?
      flash[:notice] = "unauthorized access."
      redirect_to home_path
      false
    end
  end
  
  def admin?
    session[:password] == "tr00th"
  end
  
  #def default_url_options(options)
    #{ :only_path => false, :protocol => 'https' }
  #end
  
  
end
