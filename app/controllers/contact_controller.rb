class ContactController < ApplicationController
  
  before_filter { |c| c.send :set_page_title, ['Contact'] }
  
  caches_page :index
  
  def index
  end

end
