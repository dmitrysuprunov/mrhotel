class DatePickerInput < SimpleForm::Inputs::StringInput

  def input
    value = input_html_options[:value]
    value ||= object.send(attribute_name) if object.respond_to? attribute_name
    input_html_options[:value] = value.strftime('%d %B %Y') if value
    input_html_classes << 'datepicker'
    super
  end

end