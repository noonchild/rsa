class CreatePlaylists < ActiveRecord::Migration
  def self.up
    create_table :playlists do |t|
      t.column :name, :string
      t.column :filename, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :playlists
  end
end
