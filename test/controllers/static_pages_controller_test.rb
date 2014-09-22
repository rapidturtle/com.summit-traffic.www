require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "gets index" do
    get :index
    assert_response :success
  end
end
