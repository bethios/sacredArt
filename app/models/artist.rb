class Artist < ActiveRecord::Base
  belongs_to :category
  default_scope { order('name ASC') }

  has_attached_file :main_image,
                    :default_url => 'sa_initials.jpg',
                    styles: {
                        small: '300x300#',
                        large: '500x500#'
                    }

  validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\z/

  has_attached_file :image_2,
                    :default_url => 'sa_initials.jpg',

                    styles: {
                        small: '300x300#',
                        large: '500x500#'
                    }

  validates_attachment_content_type :image_2, :content_type => /\Aimage\/.*\z/

  has_attached_file :image_3,
                    :default_url => 'sa_initials.jpg',
                    styles: {
                        small: '300x300#',
                        large: '500x500#'
                    }

  validates_attachment_content_type :image_3, :content_type => /\Aimage\/.*\z/


end
