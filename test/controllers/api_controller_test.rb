require "test_helper"

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get api_info_url
    assert_response :success
  end
end
