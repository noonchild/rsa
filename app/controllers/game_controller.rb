class GameController < ApplicationController
  before_filter :validate, :except => [:create, :facebook]
  
  def validate
    #loggied in?
    if logged_in?
      #xxx
    else
      #set up new user
      set_new_user(get_fbid_from_session)
    end
    @state = State.find_by_user_id(current_user.id)
    if @state == nil
      #no state as yet
      x = Actor.find_by_user_id(current_user.id)
      if x 
        @state = State.new
        @state.user_id = current_user.id
        @state.save
      else
        flash[:notice] = "Please set up your Rockstar."
        redirect_to(:controller => '/actor', :action => 'new')
      end
    end
    
  end
  
  def create
    #find previous game
    @state = State.find_by_user_id(current_user.id)
    if !@state
      @state = State.new
      @state.user_id = current_user.id
      @state.save
    end
    redirect_to(:action => 'play') 
  end
  
  def return
    session[:override] = "Welcome back."
    redirect_to(:action => 'play') 
  end
  
  def list
    @state = State.find_by_user_id(current_user.id)
    if @state == nil
      redirect_to(:controller => '/account', :action => 'index')
    end
    @state_pages, @states = paginate :states, :per_page => 10
    @thisguy=Actor.find_by_user_id(id)
    @location = Location.find(@state.location_id)
  end
  
  def move
      @state = State.find_by_user_id(current_user.id)
      @thisguy=Actor.find_by_user_id(current_user.id)
      if params[:id] then
        @state.change_location!(params[:id])
      end
      @state.save
      session[:option_name] = ""
      redirect_to(:action => 'play')
  end
  def jog
      @state = State.find_by_user_id(current_user.id)
      @thisguy=Actor.find_by_user_id(current_user.id)
      if @state.current_enthusiasm >= 3 then
        @state.lose_enthuse!(3)
        @thisguy.exercise!
        @state.save
        @thisguy.save
      else
        flash[:notice] = "You are too tired to jog."
      end
      #round it by hand
      myfloat = (((@thisguy.looks * 1000).to_i).to_f)/1000
      render :text => myfloat.to_s
  end
  def reset_enthusiasm
      @state = State.find_by_user_id(current_user.id)
      @thisguy=Actor.find_by_user_id(current_user.id)
      if @state.current_enthusiasm < 100 then
        @state.reset_enthuse!
        @state.save
        @thisguy.lose_burger!
        @thisguy.save
        render :text =>  @state.current_enthusiasm.to_s
      else
        render :text =>  nil
      end
  end
  
  def refresh_enthuse
      @state = State.find_by_user_id(current_user.id)
      render :text =>  @state.current_enthusiasm.to_s
  end
  
  def move_hood
      @state = State.find_by_user_id(current_user.id)
      @thisguy=Actor.find_by_user_id(current_user.id)
      if @state.current_enthusiasm >= 10 then
        @state.lose_enthuse!(10)
        if params[:id] then
          @state.change_hood!(params[:id])
          flash[:notice]="You are tired from the journey."
        end
        session[:option_name] = ""
        @state.save
        @thisguy.save
      else
        flash[:notice]="You are too tired to make it to #{Hood.find(params[:id]).name}. Maybe you should eat a burger."
      end
     
      redirect_to(:controller => '/game', :action => 'play')
  end
  
  def set_option
      @state = State.find_by_user_id(current_user.id)
      @state.set_option!(params[:id])
      @state.save
      session[:option_name] = Option.find(params[:id]).name
      #render :text =>  Option.find(params[:id]).name
      render :text =>  ""
  end
  
  def busk
      @state = State.find_by_user_id(current_user.id)
      @thisguy=Actor.find_by_user_id(current_user.id)
      if @state.current_enthusiasm >= 3 then
        @state.lose_enthuse!(3)
        @thisguy.learn!
        @state.save
        @thisguy.save
      end
      #round it by hand
      myfloat = (((@thisguy.skill * 1000).to_i).to_f)/1000
      render :text =>  myfloat.to_s
  end
  
  def flirt
      @state = State.find_by_user_id(current_user.id)
      @thisguy=Actor.find_by_user_id(current_user.id)
      if @state.current_enthusiasm >= 3 then
        @state.lose_enthuse!(3)
        @thisguy.flirt!
        @state.save
        @thisguy.save
      end
      #round it by hand
      myfloat = (((@thisguy.charisma * 1000).to_i).to_f)/1000
      render :text =>  myfloat.to_s
  end
  
  def pavement
      @state = State.find_by_user_id(current_user.id)
      @thisguy=Actor.find_by_user_id(current_user.id)
      if @state.current_enthusiasm >= 5 then
        @state.lose_enthuse!(5)
        @thisguy.pavement!
        @state.save
        @thisguy.save
      end
      #round it by hand
      myfloat = (((@thisguy.savvy * 1000).to_i).to_f)/1000
      render :text =>  myfloat.to_s
  end
  
  def play
    if not current_user then
      redirect_to(:controller => '/home')
    end
    @thisguy=Actor.find_by_user_id(current_user.id)
    if not defined? @thisguy
      redirect_to(:controller => '/actor', :action => 'new')
    end
    session[:option_name] = nil
    #@state_pages, @states = paginate :states, :per_page => 10
    @state = State.find_by_user_id(current_user.id)
    @state.option_id = 999 
    @location = Location.find(@state.location_id)
    @hood = Hood.find(@state.hood_id)
    @options = @location.options
    
  end
  
  def get_saved_name
    if session[:option_name] == nil then
      render :text =>  ""
    else
      render :text =>  session[:option_name]
    end
  end
  
  def get_nothing
    render :text =>  " "
  end
  
  def optin
    @state = State.find_by_user_id(current_user.id)
    if @state.choose_option? then
      @state.process_option!
      flash[:notice] = @state.return_message
      redirect_to rsa_play_path
    else
      flash[:notice] = @state.return_message
      redirect_to rsa_play_path
    end
  end
  
  def option_name
    @state = State.find_by_user_id(current_user.id)
    @option = Option.find_by_id(params[:id])
    render :text =>  @option.name
  end
  
end
