class ActorController < ApplicationController
  before_filter :login_required
  
  def index
    list
    render :action => 'list'
  end

  def list
    @actor = Actor.find_by_user_id(current_user.login)
    #current_user.with_actor? ? @actor : nil
  end

  def show
    @actor = Actor.find(params[:id])
  end
  
  def log
    @actor = Actor.find_by_user_id(current_user.login)
    @message = @actor.log ? @actor.log : "Hey hot stuff."
  end

  def new
    if logged_in?
      @actor = Actor.new
      @fbid = get_fbid_from_session
    else
      flash[:notice] = 'Please sign up for an account.'
      redirect_to home_url
    end
  end

  def create
    @actor = Actor.new(params[:actor])
    @actor.user_id = current_user.id
    @actor.gorandom!
    if @actor.save
      flash[:notice] = 'Rockstar was successfully created.'
      redirect_to :action => 'change', :id => @actor
    else
      render :action => 'new'
    end
  end

  def edit
    #@actor = Actor.find(params[:id])
  end
  
  def add_skill
    @actor = Actor.find(params[:id])
    @actor.add_skill!
    @actor.save
    flash[:notice] = "You added a point of Skill to your character."
    redirect_to(:controller => '/actor', :action => 'change', :id => @actor)
  end
  def add_charisma
    @actor = Actor.find(params[:id])
    @actor.add_charisma!
    @actor.save
    flash[:notice] = "You added a point of Charisma to your character."
    redirect_to(:controller => '/actor', :action => 'change', :id => @actor)
  end
  def add_looks
    @actor = Actor.find(params[:id])
    @actor.add_looks!
    @actor.save
    flash[:notice] = "You added a point of Looks to your character."
    redirect_to(:controller => '/actor', :action => 'change', :id => @actor)
  end
  def add_savvy
    @actor = Actor.find(params[:id])
    @actor.add_savvy!
    @actor.save
    flash[:notice] = "You added a point of Savvy to your character."
    redirect_to(:controller => '/actor', :action => 'change', :id => @actor)
  end
  def reset_enthuse
    @actor = Actor.find(params[:id])
    @state = State.find_by_user_id(current_user)
    @state.reset_enthuse!
    @state.save
    flash[:notice] = "You feel refreshed."
    session[:override] = "You feel refreshed."
    redirect_to(:controller => '/game', :action => 'play', :id => @actor)
  end
  def change
    @actor = Actor.find_by_user_id(current_user.id)
    @state = State.find_by_user_id(current_user.id)
    @message = @actor.log ? @actor.log : "Hey hot stuff."
    
  end
  def feed
    @thisguy = Actor.find(params[:id])
    @state = State.find_by_user_id(current_user.id)
    flash[:notice] = "Hungry? Tired? Both?"
  end
  def clear_log
    @actor = Actor.find_by_user_id(current_user.id)
    @actor.clear_log!
    @actor.save
    redirect_to(:action => 'change')
  end
  def update
    @actor = Actor.find(params[:id])
    if @actor.update_attributes(params[:actor])
      flash[:notice] = 'Actor was successfully updated.'
      redirect_to :action => 'show', :id => @actor
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    Actor.find(params[:id]).destroy
    defined? State.find_by_user_id(current_user.id) ? State.find_by_user_id(current_user.id).destroy : nil
    redirect_to(:controller => 'actor', :action => 'list' )
  end
end
