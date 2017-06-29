class Artist < ActiveRecord::Base
  belongs_to :category
  default_scope { order('name ASC') }

  has_attached_file :main_image,
                    :default_url => 'sa_initials.jpg',
                    styles: {
                        thumb: "100x100#",
                        large: '500x500#'
                    }

  attr_accessor :delete_main
  before_validation { :main_image.clear if :delete_main == '1' }

  validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\z/

  has_attached_file :image_2,
                    :default_url => 'sa_initials.jpg',

                    styles: {
                        thumb: "100x100#",
                        small: '300x300#',
                    }
  attr_accessor :delete_image_2
  before_validation { :image_2.clear if :delete_image_2 == '1' }

  validates_attachment_content_type :image_2, :content_type => /\Aimage\/.*\z/

  has_attached_file :image_3,
                    :default_url => 'sa_initials.jpg',
                    styles: {
                        thumb: "100x100#",
                        small: '300x300#',
                    }
  attr_accessor :delete_image_3
  before_validation { :image_3.clear if :delete_image_3 == '1' }

  validates_attachment_content_type :image_3, :content_type => /\Aimage\/.*\z/

  validates :name, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  validates :category_id, presence: true

end
