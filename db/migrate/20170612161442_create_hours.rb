class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
