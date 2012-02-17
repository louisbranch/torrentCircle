class CreateDailyUpdates < ActiveRecord::Migration
  def change
    create_table :daily_updates do |t|
      t.text :positions

      t.timestamps
    end
  end
end
