module ApplicationHelper
  
  def error_handling_form_for(record_or_name_or_array, *args, &proc)
    options = args.detect { |argument| argument.is_a?(Hash) }
    if options.nil?
      options = { :builder => ErrorHandlingFormBuilder }
      args << options
    end
    options[:builder] = ErrorHandlingFormBuilder unless options.nil?
    form_for(record_or_name_or_array, *args, &proc)
  end
  
end

#---
# Excerpted from "Advanced Rails Recipes",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/fr_arr for more book information.
#---
class ErrorHandlingFormBuilder < ActionView::Helpers::FormBuilder
  helpers = field_helpers +
    %w(collection_select country_select date_select datetime_select grouped_collection_select time_select select time_zone_select) -
    %w(check_box fields_for hidden_field label radio_button)

  helpers.each do |name|
    define_method name do |field, *args|
      options = args.detect { |argument| argument.is_a?(Hash) } || {}
      build_shell(field, options) do
        super(field, *args)
      end
    end
  end

  def build_shell(field, options)
    @template.capture do
      locals = {
        :element => yield,
        :label   => label(field, options[:label])
      }
      if has_errors_on?(field)
        locals.merge!(:error => error_message(field, options))
        @template.render :partial => 'forms/field_with_errors',
                         :locals  => locals
      else
        @template.render :partial => 'forms/field',
                         :locals  => locals
      end
    end
  end
  
  def error_message(field, options)
    if has_errors_on?(field)
      errors = object.errors[field]
      errors.to_sentence
    else
      ''
    end
  end
  
  def has_errors_on?(field)
    !(object.nil? || object.errors[field].blank?)
  end
  
  private
  
  def objectify_options(options)
    super.except(:label, :required, :label_class)
  end
    
end
