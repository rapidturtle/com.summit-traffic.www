# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def link_selected_to(str, regexp, path, attributes = {})
    # if the current base url is the same as the controller, then set :class = 'selected'
    if params[:controller] =~ regexp
      attributes['class'] = 'selected'
    end
    
    # construct the li and a tags
    link_to "<span>#{str}</span>", path, attributes
  end
  
end
