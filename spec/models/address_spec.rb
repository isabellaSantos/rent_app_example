require 'rails_helper'

describe Address, type: :model do

  describe 'validation' do

    let(:street) { 'Rua Tal' }
    let(:district) { 'Centro' }
    let(:city) { 'Sao Paulo' }
    let(:zipcode) { '12345678' }
    subject { Address.new(street: street, district: district, city: city, zipcode: zipcode) }

    context 'when all required attributes are specified' do

      it { is_expected.to be_valid }

    end

    context 'when street is missing' do

      let(:street) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when district is missing' do

      let(:district) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when city is missing' do

      let(:city) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when zipcode is missing' do

      let(:zipcode) { nil }

      it { is_expected.not_to be_valid }

    end
  end

end
