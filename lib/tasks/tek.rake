require 'config/environment'
include Dbscript

namespace :tek do
  
  task :dump_all do
    Song.find(:all).each do |this|
      this.destroy
     end
    Album.find(:all).each do |this|
      this.destroy
    end
  end
  
  task :get_songs do
     
    #sh "railroad -i -l -C | neato -Tsvg | sed 's/font-size:14.00/font-size:11.00/g' > doc/controllers.svg"
    #get files
     require "rubygems"
     require "id3lib"
     require "fileutils"
     require 'find'
     movedir = "public/mp3/"
     #files = sh "ls #{movedir}*.mp3"
       counter = 0
       
       Song.find(:all).each do |this|
         this.destroy
        end
       Album.find(:all).each do |this|
         this.destroy
       end
       
       Find.find(movedir) do |path|
         counter += 1
         if FileTest.directory?(path)
           if File.basename(path)[0] == ""
             Find.prune       # Don't look any further into this directory.
           else
             next
           end
         elsif path.slice("/.")
           Find.prune       # Don't look any further into this directory.
         else
           puts "is file"
           puts path
           tag = ID3Lib::Tag.new(path)
           new_name = tag.title.gsub("00",'') if tag.title
           album = tag.album if tag.album
           year = tag.year if tag.year
           new_name = new_name.gsub(/[^a-zA-Z|\s]/,'')
           new_name2 = new_name
           myArray = new_name2.split(/ /)
           send_this = ""
           myArray.each do |ma|
             send_this += "#{ma.capitalize} "
           end
           
           puts send_this
           #figure album
           album_id = find_or_insert_new_album(album, year)
           #get indentifier
           #save song
           new_path = insert_new_song(send_this, album_id, path, counter, year)
           #rename file
           FileUtils.move(path, "#{movedir}#{new_path}.mp3") if new_name and !new_name.empty? rescue nil
         end
       end
    
  end
end