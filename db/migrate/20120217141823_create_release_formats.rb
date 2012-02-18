class CreateReleaseFormats < ActiveRecord::Migration
  def change
    create_table :release_formats do |t|
      t.string :name
      t.text :labels
      t.text :description
      t.timestamps
    end
  end
end
