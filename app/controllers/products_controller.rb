class ProductsController < ApplicationController
  
  before_filter { |c| c.send :set_page_title, ['Products'] }
  
  def index
  end

end
