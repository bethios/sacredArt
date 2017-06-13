class AddCategoryToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :category_id, :integer
    add_index :artists, :category_id
  end
end
20170530210511