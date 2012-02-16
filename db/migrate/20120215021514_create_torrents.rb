class CreateTorrents < ActiveRecord::Migration
  def change
    create_table :torrents do |t|
      t.string :pid
      t.string :name
      t.string :url
      t.string :tracker
      t.string :magnet
      t.integer :downloads_count, :default => 0
      t.references :movie
      t.references :format
      t.timestamps
    end
    add_index :torrents, :pid
    add_index :torrents, :movie_id
    add_index :torrents, :format_id
  end
end
