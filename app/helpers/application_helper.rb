# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def selected_link_to(*args, &block)
    # check for regular expression
    if args.length > 3
      regexp = args.pop
      args.third.merge!(:class => 'selected') if %r{#{regexp}}.match(params[:controller])
    end
    
    # generate link
    link_to *args, &block
  end
  
end
