class Institute < ActiveRecord::Base
  has_many :teachers
  validates_presence_of :name
  validates :zipcode, format:{with:/\d+{5}/}
end
