class ProductsController < ApplicationController
  
  before_filter { |c| c.send :set_page_title, ['Products'] }
  caches_page :index
  
  def index
  end

end
