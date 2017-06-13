class AddAttachmentMainImageToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :main_image
    end
  end

  def self.down
    remove_attachment :artists, :main_image
  end
end
