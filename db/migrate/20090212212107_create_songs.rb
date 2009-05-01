class CreateSongs < ActiveRecord::Migration
  def self.up
    
    create_table :songs do |t|
      t.column :dname, :string
      t.column :name, :string
      t.column :filename, :string
      t.column :subdir, :string
      t.column :lyrics, :text
      t.column :note, :text
      t.column :has_audio, :boolean
      t.column :active, :boolean
      t.column :views, :integer
      t.column :album_id, :integer
      t.column :digi_qot, :float
      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
