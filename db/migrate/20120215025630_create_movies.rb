class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.string :url
      t.string :poster_url
      t.text :plot
      t.has_attached_file :poster
      t.timestamps
    end
  end
end
