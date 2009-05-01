class AlbumsController < ApplicationController
  before_filter :check_login
  
  def index
    list
    render :action => 'list'
  end

  def list
    @albums = Album.find(:all, :order => "name")
    @page_title = "InMusic.org"
  end

  def show
    @page_title = "InMusic.org"
    if params[:id].to_i > 0
      @album = Album.find(params[:id])
    end
    
    if !@album
      redirect_to albums_path
    end
  end

  def new
    @page_title = "InMusic.org"
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      flash[:notice] = 'album was successfully created.'
      redirect_to albums_path
    else
      render :action => 'new'
    end
  end

  def edit
    @page_title = "InMusic.org"
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      flash[:notice] = 'album was successfully updated.'
      redirect_to albums_path
    else
      render :action => 'edit'
    end 
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to albums_path
  end
end
