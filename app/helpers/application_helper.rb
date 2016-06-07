module ApplicationHelper

  def plural_resource_name(resource_class)
    resource_class.model_name.human(count: 2)
  end

  def human_attribute_name(resource_class, attribute)
    resource_class.human_attribute_name attribute
  end

end
