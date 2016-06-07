class Product < ActiveRecord::Base

  belongs_to :product_category
  has_many :manage_products

  validates :name, presence: true
  validates :minimum_price, presence: true
  validates :product_category, presence: true

end
