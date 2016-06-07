require 'rails_helper'

describe Customer, type: :model do

  describe 'validation' do

    let(:cpf) { '123456789' }
    let(:phone) { '12345' }
    let(:address) { FactoryGirl.build(:address) }
    let(:user) { FactoryGirl.build(:customer_user) }
    subject { Customer.new(cpf: cpf, phone: phone, address: address, user: user) }

    context 'when all required attributes are specified' do

      it { is_expected.to be_valid }

    end

    context 'when CPF is missing' do

      let(:cpf) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when phone is missing' do

      let(:phone) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when address is missing' do

      let(:address) { nil }

      it { is_expected.not_to be_valid }

    end

    context 'when user is missing' do

      let(:user) { nil }

      it { is_expected.not_to be_valid }

    end
  end

  it 'should return the name of the user' do
    customer = create(:customer)
    expect(customer.name).to eq 'User'
  end

  it 'should return the email of the user' do
    customer = create(:customer)
    expect(customer.email).to eq 'customer@test.com'
  end

end
