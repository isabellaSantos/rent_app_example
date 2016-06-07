class Payment < ActiveRecord::Base

  include NumberGenerator

  def generate_number(options = {})
    options[:prefix] ||= 'P'
    options[:length] ||= 10
    super(options)
  end

  belongs_to :order
  belongs_to :customer

end