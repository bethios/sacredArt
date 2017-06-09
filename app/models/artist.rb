class Artist < ActiveRecord::Base
  belongs_to :category
  default_scope { order('name') }

  has_attached_file :main_image
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/


end
