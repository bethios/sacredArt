class Artist < ActiveRecord::Base
  belongs_to :category
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  default_scope { order('name') }

  validates_attachment :image, :presence => true,
                       :content_type => { :content_type => "image/jpg" },
                       :size => { :in => 0..100.kilobytes }
end
