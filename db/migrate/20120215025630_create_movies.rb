class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.string :url
      t.string :image
      t.text :plot
      t.timestamps
    end
  end
end
