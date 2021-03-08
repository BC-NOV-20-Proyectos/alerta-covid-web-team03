require "test_helper"

class UserHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_history = user_histories(:one)
  end

  test "should get index" do
    get user_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_user_history_url
    assert_response :success
  end

  test "should create user_history" do
    assert_difference('UserHistory.count') do
      post user_histories_url, params: { user_history: { date: @user_history.date, user_id: @user_history.user_id } }
    end

    assert_redirected_to user_history_url(UserHistory.last)
  end

  test "should show user_history" do
    get user_history_url(@user_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_history_url(@user_history)
    assert_response :success
  end

  test "should update user_history" do
    patch user_history_url(@user_history), params: { user_history: { date: @user_history.date, user_id: @user_history.user_id } }
    assert_redirected_to user_history_url(@user_history)
  end

  test "should destroy user_history" do
    assert_difference('UserHistory.count', -1) do
      delete user_history_url(@user_history)
    end

    assert_redirected_to user_histories_url
  end
end
