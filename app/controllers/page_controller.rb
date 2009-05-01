class PageController < ApplicationController

  def view
    i=(params[:id] or 1)
    @page = Page.find(i)
    @pages = Page.find(:all)
  end
  
end
