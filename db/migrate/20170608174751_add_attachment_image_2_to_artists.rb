class AddAttachmentImage2ToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :image_2
    end
  end

  def self.down
    remove_attachment :artists, :image_2
  end
end
