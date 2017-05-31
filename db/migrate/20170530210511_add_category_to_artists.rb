class AddCategoryToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :topic_id, :integer
    add_index :artists, :topic_id
  end
end
