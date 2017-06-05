class AddImageToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :image, :attachment
  end
end
