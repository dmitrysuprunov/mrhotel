class BooleanInput < SimpleForm::Inputs::BooleanInput

  def input
    input_html_options['data-toggle'] ||= 'checkbox'
    super
  end

end