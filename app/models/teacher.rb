class Teacher < ActiveRecord::Base
  belongs_to :institute
  validates_presence_of :last_name, :first_name, :department,:office_address
  validates :email_address, :email => true
  validates :phone_number, format: {with: /\d+{10}/}
end
