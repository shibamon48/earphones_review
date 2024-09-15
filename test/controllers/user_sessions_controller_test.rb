require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get user_sessions_login_url
    assert_response :success
  end

  test "should get logout" do
    get user_sessions_logout_url
    assert_response :success
  end
end
