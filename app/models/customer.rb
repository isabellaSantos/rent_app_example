class Customer < ActiveRecord::Base

  belongs_to :address
  belongs_to :user
  has_many :orders
  has_many :payments

  validates :cpf, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :user, presence: true

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :user

  def name
    user.name
  rescue
    ''
  end

  def email
    user.email
  rescue
    ''
  end

end
