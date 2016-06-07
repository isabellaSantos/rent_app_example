class Order < ActiveRecord::Base

  include NumberGenerator

  def generate_number(options = {})
    options[:prefix] ||= 'O'
    options[:length] ||= 10
    super(options)
  end

  belongs_to :address
  belongs_to :customer
  has_many :line_items
  has_many :payments
  has_many :manage_products, through: :line_items

  accepts_nested_attributes_for :line_items
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :payments

  attr_accessor :months_quantity

  state_machine initial: :cart do
    event :delivery do
      transition from: :cart, to: :delivery, if: :any_line_items?
    end

    event :payment do
      transition from: :delivery, to: :payment, if: :delivery_address?
    end
    before_transition to: :payment, do: :update_order
    before_transition to: :payment, do: :create_payments

    event :complete do
      transition from: :payment, to: :complete
    end

    event :finalized do
      transition from: :complete, to: :finalized
    end

    event :canceled do
      transition from: any, to: :canceled
    end
  end

  def any_line_items?
    line_items.any?
  end

  def delivery_address?
    address.present?
  end

  def self.by_customer(customer)
    where(customer: customer)
  end

  private

  def calculate_total
    total = line_items.sum(:total)
    update_attributes(total: total)
  end

  def create_payments
    month_total = line_items.sum(:total)
    months_quantity.times do |i|
      due_date = initial_date + i.months
      Payment.create(order_id: id, customer_id: customer_id, due_date: due_date, value: month_total)
    end
  end

  def update_order
    final_date = initial_date * months_quantity.months
    total = line_items.sum(:total) + months_quantity
    update_attributes(final_date: final_date, total: total)
  end

end
