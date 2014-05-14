require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  # full_title

  test "should format a full title when an argument is given" do
    assert_equal "Summit Traffic Solutions | Contact", full_title("Contact")
  end

  test "should return a base title when no argument is given" do
    assert_equal "Summit Traffic Solutions", full_title('')
  end
end
