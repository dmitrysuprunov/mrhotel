class CurrencyInput < SimpleForm::Inputs::StringInput

  def input
    input_html_classes << 'money-field'
    super
  end

end
