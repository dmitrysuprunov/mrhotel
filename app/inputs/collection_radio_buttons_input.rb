class CollectionRadioButtonsInput < SimpleForm::Inputs::CollectionRadioButtonsInput

  def input
    input_html_options.merge!({ :data => {:toggle => 'radio'} })
    super
  end

end
