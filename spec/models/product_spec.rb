require 'rails_helper'

describe ProductCategory, type: :model do

  describe 'validation' do

    let(:name) { 'Test' }
    let(:minimum_price) { 100 }
    let(:category) { FactoryGirl.build(:product_category) }
    subject { Product.new(name: name, minimum_price: minimum_price, product_category: category) }

    context 'when all required attributes are specified' do

      it { is_expected.to be_valid }

    end

    context 'when name is missing' do

      let(:name) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when minimum price is missing' do

      let(:minimum_price) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when product category is missing' do

      let(:category) { nil }

      it { is_expected.not_to be_valid }

    end

  end

end
