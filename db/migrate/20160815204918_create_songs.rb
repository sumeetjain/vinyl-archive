class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_file
      t.string :song_name

      t.timestamps null: false
    end
  end
end
