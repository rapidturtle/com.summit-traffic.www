class HomeController < ApplicationController
  def index
    @articles = Article.current.select("id, title").limit(5).order('post_date DESC')
  end

end
