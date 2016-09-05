class AddFileToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :file, :string
  end
end
