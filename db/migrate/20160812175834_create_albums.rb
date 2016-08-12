class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :artist_id
      t.string :name
      t.string :genre
      t.date :release_date
      t.string :format

      t.timestamps null: false
    end
  end
end
