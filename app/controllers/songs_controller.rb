class SongsController < ApplicationController
  before_filter :check_login
  @page_title = "InMusic.org"
  
  def index
    list
    render :action => 'list'
  end

  def list
    @page_title = "InMusic.org"
    #@songs = Song.find(:all, :order => "name")
    @songs = Song.paginate :page => params[:page], :order => 'dname ASC', :per_page => 10
  end

  def show
    @page_title = "InMusic.org"
    if params[:id].to_i > 0
      @song = Song.find(params[:id])
    end
    
    if !@song
      redirect_to songs_path
    end
  end

  def new
    @page_title = "InMusic.org"
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      flash[:notice] = 'song was successfully created.'
      redirect_to songs_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page_title = "InMusic.org"
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update_attributes(params[:song])
      flash[:notice] = 'song was successfully updated.'
      redirect_to songs_path
    else
      render :action => 'edit'
    end 
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end
  
end
