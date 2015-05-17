require "test_helper"

class StaticPagesControllerTest < ActionController::TestCase
  test "gets index" do
    get :index
    must_respond_with :success
  end

  test "gets manufacturers" do
    get :manufacturers
    must_respond_with :success
  end

  test "gets contact" do
    get :contact
    must_respond_with :success
  end
end
