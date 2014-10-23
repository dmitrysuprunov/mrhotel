class EnumInput < SimpleForm::Inputs::CollectionSelectInput # ChosenInput

  def input
    options[:collection] = object_name.to_s.capitalize.constantize.send(attribute_name.to_s.pluralize.to_sym).map { |v, k| [ v.titleize, v ] }
    input_html_classes << 'chosen-select'
    super
  end

end


