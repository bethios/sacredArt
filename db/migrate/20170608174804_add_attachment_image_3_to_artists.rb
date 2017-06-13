class AddAttachmentImage3ToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :image_3
    end
  end

  def self.down
    remove_attachment :artists, :image_3
  end
end
