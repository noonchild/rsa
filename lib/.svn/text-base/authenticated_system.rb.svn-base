module AuthenticatedSystem
  # Accesses the current user from the session.
  def current_user
    @current_user || login_new_user(set_fbid_for_session(get_fbid))
  end
  
  def logged_in?
    @current_user && @current_user.login
  end
  
  def get_fake_id
    return "3344222255"
  end
  
  def login_required
    not (current_user)
  end
  
  def set_new_user(fbid)
    if fbid.to_i > 0
      login_new_user(fbid.to_i)
    end
  end
  
  # Store the given user in the session.
  def current_user=(new_user)
    session[:user] = (new_user.nil? || new_user.is_a?(Symbol)) ? nil : new_user.id
    @current_user = new_user
  end
  
  private
  
    def login_new_user(this_id)
      x = User.find_by_login(this_id)
      if x 
        @current_user=x
      else
        x = User.new
        x.crypted_password = "#{Time.now.year}#{pad_month(Time.now.month)}#{pad_month(Time.now.mday)}"
        x.login = this_id
        x.save
        @current_user=x
      end
      @current_user
    end
    
    def login_test_user
      x = User.find_by_login(get_fake_id)
      if x 
        @current_user=x
      else
        x = User.new
        x.crypted_password = "#{Time.now.year}#{pad_month(Time.now.month)}#{pad_month(Time.now.mday)}"
        x.login = get_fake_id
        x.save
        @current_user=x
      end
      @current_user
    end
    
    
end
