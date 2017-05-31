class AddCategoryColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :category, :string
  end
end
