class ContactController < ApplicationController
  
  before_filter { |c| c.send :set_page_title, ['Contact'] }
    
  def index
  end

end
