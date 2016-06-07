class ManageProduct < ActiveRecord::Base

  include NumberGenerator

  def generate_number(options = {})
    options[:prefix] ||= 'M'
    options[:length] ||= 10
    super(options)
  end

  belongs_to :product

  validates :number, presence: true
  validates :product, presence: true

  scope :only_available, -> { where(state: 'available') }

  state_machine initial: :available do
    event :leased do
      transition from: :available, to: :leased
    end

    event :available do
      transition from: [:leased, :maintenance], to: :available
    end

    event :maintenance do
      transition from: :available, to: :maintenance
    end
  end

end
