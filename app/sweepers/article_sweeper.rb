class ArticleSweeper < ActionController::Caching::Sweeper
  observe Article
  
  def after_save(article)
    expire_cache(article)
  end
  
  def after_destroy(article)
    expire_cache(article)
  end
  
  def expire_cache(article)
    expire_page(articles_path)
    expire_page(formatted_articles_path(:rss))
    expire_page(article_path(article))
  end
end
