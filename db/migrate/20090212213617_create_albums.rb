class CreateAlbums < ActiveRecord::Migration
  def self.up
    
    create_table :albums do |t|
      t.column :name, :string
      t.column :dpath, :string
      t.column :note, :text
      t.column :gpath, :string
      t.column :active, :boolean
      t.column :views, :integer
      t.column :spath, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
