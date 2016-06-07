require 'rails_helper'

describe User, type: :model do

  context 'role' do

    it 'admin?' do
      admin_user = create(:admin_user)
      expect(admin_user.admin?).to be_truthy
      user = create(:user)
      expect(user.admin?).to be_falsey
    end

    it 'customer?' do
      customer_user = create(:customer_user)
      expect(customer_user.customer?).to be_truthy
      user = create(:user)
      expect(user.customer?).to be_falsey
    end

  end

end