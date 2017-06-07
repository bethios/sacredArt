class Artist < ActiveRecord::Base
  belongs_to :category
  default_scope { order('name') }

end
