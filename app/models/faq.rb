class Faq < ActiveRecord::Base
  validates :question, length: { minimum: 10 }, presence: true
  validates :answer, length: {minimum: 3 }, presence: true

end
