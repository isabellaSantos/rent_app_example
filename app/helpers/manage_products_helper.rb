module ManageProductsHelper

  def render_state_label(state)
    state_color = case state.to_sym
                    when :available then 'teal darken-1'
                    when :leased then 'deep-orange darken-1'
                    when :maintenance then 'red darken-1'
                  end
    state_label = ManageProduct.human_attribute_name("state_#{state}")
    content_tag :span, state_label, class: "state-badge white-text #{state_color}"
  end

end
