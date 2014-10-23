module ViewHelper

  def menu_item_by_controller(name, path, controller_name )
    menu_item(name, path, params[:controller] == controller_name)
  end

  def menu_item(name, path, is_active)
    content_tag(:li, link_to(name, path), :class => is_active ? 'active' : '')
  end

end
