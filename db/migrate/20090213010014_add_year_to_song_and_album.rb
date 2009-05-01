class AddYearToSongAndAlbum < ActiveRecord::Migration
  def self.up
    add_column :songs, :release_year, :integer
    add_column :albums, :release_year, :integer
    add_column :songs, :release_date, :datetime
    add_column :albums, :release_date, :datetime
  end

  def self.down
    remove_column :songs, :release_year
    remove_column :albums, :release_year
    remove_column :songs, :release_date
    remove_column :albums, :release_date
  end
end
