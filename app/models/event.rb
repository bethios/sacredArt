class Event < ActiveRecord::Base
  default_scope { order('date ASC') }

end
