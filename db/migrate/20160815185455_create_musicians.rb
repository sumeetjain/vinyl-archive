class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.integer :artist_id
      t.string :name
      t.string :instrument

      t.timestamps null: false
    end
  end
end
