class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :when
      t.text :body

      t.timestamps null: false
    end
  end
end
