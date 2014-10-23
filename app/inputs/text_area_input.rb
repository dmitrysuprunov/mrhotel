class TextAreaInput < SimpleForm::Inputs::TextInput

  def input
    input_html_classes << 'row-fluid-textarea'
    super
  end

end
