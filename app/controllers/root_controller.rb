class RootController < ApplicationController
  
  def index
    @articles = Article.current(:select => 'id, title', :limit => 5)
  end

end
