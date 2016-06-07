class Address < ActiveRecord::Base

  validates :street, presence: true
  validates :district, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true

end