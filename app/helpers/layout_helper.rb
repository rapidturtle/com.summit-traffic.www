module LayoutHelper
	def title(page_title, show_title = true)
		content_for(:title, page_title.to_s)
		@show_title = show_title
	end
	
	def show_title?
		@show_title
	end
	
	def stylesheet(*args)
		content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
	end
	
	def javascript(*args)
		args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
		content_for(:script) { javascript_include_tag(*args) }
	end
  
  # Custom tab_to helper for site navigation  
  def tab_to(*args, &block)
    # Extract the incoming :match argument and construct the regular expression
    hash = args.last.delete(:match)
    re = %r{\A/?(#{hash.join('|')}).*?\z}
    
    # Add class="selected" if the current path matches and construct the link
    args.last[:class] += ' selected' if re.match(params[:controller])
    link_to *args, &block
  end
end
