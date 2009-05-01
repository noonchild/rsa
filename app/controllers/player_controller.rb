class PlayerController < ApplicationController  

  def rr
    @page_title = "InMusic.org"
    @skip_graphic = params[:skip] ? 1 : 0
    @x = Playlist.find(:first, :order => "id DESC")
  end

end