require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  test "invalid with empty attributes" do
    article = Article.new
    assert !article.valid?
    assert article.errors.invalid?(:title)
    assert article.errors.invalid?(:body)
    assert article.errors.invalid?(:post_date), "saving #{:post_date}"
  end
  
end
