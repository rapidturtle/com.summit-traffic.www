require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "formats a fill title with an argument" do
    assert_equal 'Summit Traffic Solutions - Contact', full_title('Contact')
  end

  test "formats a full title without an argument" do
    assert_equal 'Summit Traffic Solutions', full_title('')
  end
end
