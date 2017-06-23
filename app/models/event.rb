class Event < ActiveRecord::Base
  default_scope { order('date ASC') }
  validates :title, presence: true, length: { minimum: 5 }
  validates :date, presence: true
  validates :body, presence: true, length: { minimum: 20 }

end
