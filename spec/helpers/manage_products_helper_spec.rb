require 'rails_helper'

describe ManageProductsHelper, type: :helper do

  context 'render_state_label' do

    it 'should return the label of the manage product' do
      expect(helper.render_state_label('available')).to eq "<span class=\"state-badge white-text teal darken-1\">Disponível</span>"
      expect(helper.render_state_label('leased')).to eq "<span class=\"state-badge white-text deep-orange darken-1\">Locado</span>"
      expect(helper.render_state_label('maintenance')).to eq "<span class=\"state-badge white-text red darken-1\">Em Manutenção</span>"
    end

  end

end