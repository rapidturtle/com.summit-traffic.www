require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "gets index" do
    get :index
    assert_response :success
  end

  test "gets manufacturers" do
    get :manufacturers
    assert_response :success
  end

  test "gets contact" do
    get :contact
    assert_response :success
  end
end
