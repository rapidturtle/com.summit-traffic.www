# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Custom form builder
  def error_handling_form_for(record_or_name_or_array, *args, &proc)
    options = args.detect { |argument| argument.is_a?(Hash) }
    if options.nil?
      options = {:builder => ErrorHandlingFormBuilder}
      args << options
    end
    options[:builder] = ErrorHandlingFormBuilder unless options.nil?
    form_for(record_or_name_or_array, *args, &proc)
  end
  
  # Custom link_to helper for site navigation
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
