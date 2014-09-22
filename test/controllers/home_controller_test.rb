require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "gets index" do
    get :index
    assert_response :success
  end
end
