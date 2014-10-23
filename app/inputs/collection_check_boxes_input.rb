class CollectionCheckBoxesInput < SimpleForm::Inputs::CollectionCheckBoxesInput

  def input
    input_html_options.merge!({ :data => {:toggle => 'checkbox'} })
    super
  end

end