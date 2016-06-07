require 'rails_helper'

describe LineItem, type: :model do

  describe 'validation' do

    let(:total) { 100 }
    let(:product) { create(:product, minimum_price: 100) }
    subject { LineItem.new(total: total, product: product) }

    context 'when all required attributes are specified' do

      it { is_expected.to be_valid }

    end

    context 'when total is missing' do

      let(:total) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when product is missing' do

      let(:product) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when total is less than product minimum price' do

      let(:total) { 50 }

      it { is_expected.not_to be_valid }

    end

  end

end