require 'test_helper'

class FriendshipRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get friendship_requests_create_url
    assert_response :success
  end

  test "should get show" do
    get friendship_requests_show_url
    assert_response :success
  end

end
