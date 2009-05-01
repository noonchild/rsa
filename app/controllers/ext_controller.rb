class ExtController < ApplicationController  
  def rr
    @page_title = "InMusic.org"
    @skip_graphic = params[:skip] ? 1 : 0
    @x = Playlist.find(:first, :order => "id DESC")
  end
  
  def facebook
    @fbid = get_fbid
  end
  
end
