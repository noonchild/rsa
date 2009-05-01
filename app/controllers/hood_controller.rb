class HoodController < ApplicationController
  before_filter :login_required
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @hood_pages, @hoods = paginate :hoods, :per_page => 10
  end

  def show
    @hood = Hood.find(params[:id])
    @locations = Location.find_by_hood_id(:all, @hood)
  end

  def new
    @hood = Hood.new
  end

  def create
    @hood = Hood.new(params[:hood])
    if @hood.save
      flash[:notice] = 'Hood was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @hood = Hood.find(params[:id])
  end

  def update
    @hood = Hood.find(params[:id])
    if @hood.update_attributes(params[:hood])
      flash[:notice] = 'Hood was successfully updated.'
      redirect_to :action => 'show', :id => @hood
    else
      render :action => 'edit'
    end
  end

  def destroy
    Hood.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
