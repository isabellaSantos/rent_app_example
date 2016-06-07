require 'rails_helper'

describe ApplicationHelper, type: :helper do

  xcontext 'plural_resource_name' do

    it 'should return the name of resource translated' do
      expect(helper.plural_resource_name(Order)).to eq 'Pedidos'
    end

  end

  xcontext 'human_attribute_name' do

    it 'should return the attributes of resource translated' do
      expect(helper.human_attribute_name(Order, :total)).to eq 'Total'
    end

  end

end