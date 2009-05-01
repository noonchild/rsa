module Dbscript
    def assemble_test_playlist
      headers['Content-Type'] = "application/xspf+xml"
      headers['Content-Disposition'] = "filename='p1.xspf'"
      headers['Cache-Control'] = ''
      movedir = "public/playlists/"
      f_name = new_p_code

      File.open(f_name, 'w') do |f| 

        f.puts "<?xml version='1.0' encoding='UTF-8'?>
        <playlist version='0' xmlns = 'http://xspf.org/ns/0/'>
        <title>InMusic.org plays Krister Axel</title>
          <trackList>"
        #build random song list
        Song.set_all_selected_off
        x = []
        added_i = 0
        song_count = counter = 0
        max = params[:max_num] ? params[:max_num].to_i : 14
        for i in 1..max
            pick = get_random_song
            if counter < max
              x << pick
              counter+=1
            end
            song_count+=1
        end
        
          x.sort_by { rand }
          x.each do |s|
            f.puts "<track>
              <location>#{s.lo_link}</location>
              <image>../images/covers/#{s.album.gpath}</image>
              <title>#{s.name} (from the album #{s.album.name})</title>
              <annotation>#{s.name} by Krister Axel (from the album #{s.album.name})</annotation>
              <creator>Krister Axel</creator>
             </track>"
          end

          f.puts "
          </trackList>
        </playlist>
          "
        end

        FileUtils.mv f_name, "#{movedir}#{f_name}"
        x = Playlist.new(:filename => f_name)
        x.save
    end
    
    def new_p_code
      "#{Time.now.strftime('%Y%m%d%I%M%S')}.xspf"
    end
    
    def find_or_insert_new_album(name, y)
      x = Album.find(:first, :conditions => ["name = ?", name])
      if x && x.id then
        return x.id
      else
        result = Album.new(:name => clean(name), :release_year => y)
        if result.save then
          return result.id
        else
          0
        end
      end
    end
    
    def insert_new_song(name, album_id, path, counter, year)
      #return new path
      new_path = "#{Time.now.year}#{pad_month(Time.now.month)}#{pad_month(Time.now.mday)}#{pad_month(counter)}"
      s = Song.new(:dname => clean(name), :name => clean(name), :filename => new_path, :subdir => path, :album_id => album_id, :release_year => year)
      if s.save
        return new_path
      end
    end
    
    def pad_month(this)
      if this.to_i < 10
        return "0#{this}"
      else
        return "#{this}"
      end
    end
    
    protected
    def get_random_song
      #return single Song obj
      x = Song.find(:all, :conditions => ["selected = 0"])
      r = rand(x.size)
      x[r].set_selected
      x[r]
    end
    
    def clean(string)
      return string.strip
    end
end

