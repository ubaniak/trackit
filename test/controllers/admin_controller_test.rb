require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get panal" do
    get :panal
    assert_response :success
  end

end
