class Song < ActiveRecord::Base
  belongs_to :album
  
  def lo_link
    "/mp3/#{self.filename}.mp3"
  end
  
  def set_selected
    self.selected = 1
    save
  end
  
  def self.set_all_selected_off
    Song.find(:all).each do |s|
      s.selected = 0
      s.save
    end
  end
end
