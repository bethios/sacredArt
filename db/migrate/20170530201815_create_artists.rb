class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :body
      t.string :main_image
      t.string :image_2
      t.string :image_3

      t.timestamps null: false
    end
  end
end
