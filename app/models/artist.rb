class Artist < ActiveRecord::Base
  belongs_to :category
  default_scope { order('name ASC') }

  has_attached_file :main_image,
                    :default_url => 'sa_initials.jpg',
                    styles: {
                        large: '500x500#'
                    }

  validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\z/

  has_attached_file :image_2,
                    :default_url => 'sa_initials.jpg',

                    styles: {
                        small: '300x300#',
                    }

  validates_attachment_content_type :image_2, :content_type => /\Aimage\/.*\z/

  has_attached_file :image_3,
                    :default_url => 'sa_initials.jpg',
                    styles: {
                        small: '300x300#',
                    }

  validates_attachment_content_type :image_3, :content_type => /\Aimage\/.*\z/

  validates :name, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  validates :category_id, presence: true
end
