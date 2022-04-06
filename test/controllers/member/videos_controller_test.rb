require "test_helper"

class Member::VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_videos_index_url
    assert_response :success
  end

  test "should get show" do
    get member_videos_show_url
    assert_response :success
  end

  test "should get destroy" do
    get member_videos_destroy_url
    assert_response :success
  end
end
