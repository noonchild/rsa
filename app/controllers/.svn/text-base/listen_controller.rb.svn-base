class ListenController < ApplicationController
  include Dbscript
  def index
    @page_title = "InMusic.org"
  end
  
  def reset_p1
    if assemble_test_playlist
      redirect_to :controller => "listen"
    else
      flash[:notice] = "proleems"
      redirect_to :controller => "listen"
    end
  end
end
