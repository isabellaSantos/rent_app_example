class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :customer

  def admin?
    role == 'admin'
  end

  def customer?
    role == 'customer'
  end

end
