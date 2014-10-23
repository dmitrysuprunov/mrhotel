class InlineCheckboxInput < SimpleForm::Inputs::BooleanInput

  def input
    options[:label] = false
    input_html_options['data-toggle'] ||= 'checkbox'
    options[:inline_label] = true
    super
  end

end