class AddSelected < ActiveRecord::Migration
  def self.up
    add_column :songs, :selected, :boolean
    add_column :albums, :selected, :boolean
  end

  def self.down
    remove_column :songs, :selected
    remove_column :albums, :selected
  end
end
