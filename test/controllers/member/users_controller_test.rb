require "test_helper"

class Member::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get member_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get member_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get member_users_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get member_users_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get member_users_withdraw_url
    assert_response :success
  end
end
