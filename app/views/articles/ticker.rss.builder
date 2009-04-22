xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  xml.channel do
    xml.title 'Summit Traffic Solutions News'
    xml.description 'Traffic industry news for the western United States'
    xml.link formatted_articles_url(:rss)
    
    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description truncate(article.body, :length => 50)
        xml.pubDate article.post_date(:rfc822)
        xml.link article_url(article)
      end
    end
  end
end