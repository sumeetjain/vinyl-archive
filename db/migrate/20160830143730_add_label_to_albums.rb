class AddLabelToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :label, :string, default: "NA"
  end
end
