class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product
  belongs_to :manage_product

  validates :total, presence: true
  validates :product, presence: true
  validate :minimum_price

  private

  def minimum_price
    return false if total.nil? or product.nil?
    if total < product.minimum_price
      errors.add(:total, I18n.t('errors.messages.total_should_be_eq_or_gt_than_minimum_price'))
    end
  end

end