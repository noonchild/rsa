class HomeController < ApplicationController
  def index
    #try_this = params[:fb_sig_user] || get_fbid
    if params[:fb_sig_app_id].to_i == 57497552456
      try_this = params[:fb_sig_user] || get_fbid
    else
      #redirect here later if necessary
      try_this = 0
    end
    if try_this.to_i > 0
      @fbid = try_this.to_i
      set_fbid_for_session(@fbid)
    else
      @fbid = get_fake_id
    end
  end
end