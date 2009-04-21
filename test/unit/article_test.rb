require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "invalid with empty attributes" do
    article = Article.new
    assert !article.valid?
    assert article.errors.invalid?(:title)
    assert article.errors.invalid?(:body)
    assert article.errors.invalid?(:post_date), "saving #{:post_date}"
  end
end
