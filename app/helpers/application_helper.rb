# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include AuthenticatedSystem
  def rsa_header
    "RockStarAlley "
  end
  def rsa_subtitle
    "Shine on."
  end
  def logged_in?
    false
  end
  
  def streamlined_branding
    link_to image_tag("inmusic-logo2.png", :border => 0, :title => "InMusic.org"), home_url
  end
  
  def streamlined_side_menus

    if admin?
      [
        ["Listen", listen_path],
        ["Albums", albums_path],
        ["Songs", songs_path]
      ]
    else
      [
        ["Listen", listen_path]
      ]
    end
  end
  
  def streamlined_top_menus
    if admin?
      [
        ["Krister Axel", "http://www.last.fm/music/Krister+Axel"],
        ["Noonchild", "http://www.last.fm/user/noonchild"],
        ["RockStarAlley", "http://www.last.fm/label/RockStarAlley"],
        ["Podcast", "http://feedproxy.google.com/RockStarAlley"],
        ["InMusic Store", "http://vesuvi.us"],
        ["Logout", logout_path]
      ]
    else
      [
        ["RockStarAlley", "http://www.last.fm/label/RockStarAlley"],
        ["Podcast", "http://feedproxy.google.com/RockStarAlley"],
        ["InMusic Store", "http://vesuvi.us"],
        ["Login", login_path]
      ]
    end
    
  end
  
  def add_bulletin?
    false
  end
  
  def streamlined_footer
    "&copy; #{Time.now.year} <a href='http://codeboxer.com' target='_blank'>codeboxer.com</a>"
  end
end
