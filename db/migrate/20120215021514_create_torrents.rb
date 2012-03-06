class CreateTorrents < ActiveRecord::Migration
  def change
    create_table :torrents do |t|
      t.string :pid
      t.string :name
      t.string :url
      t.text :magnet
      t.integer :downloads_count, :default => 0
      t.references :movie
      t.references :release_format
      t.timestamps
    end
    add_index :torrents, :pid
    add_index :torrents, :movie_id
    add_index :torrents, :release_format_id
  end
end
