require "test_helper"

class UserHistoryDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_history_detail = user_history_details(:one)
  end

  test "should get index" do
    get user_history_details_url
    assert_response :success
  end

  test "should get new" do
    get new_user_history_detail_url
    assert_response :success
  end

  test "should create user_history_detail" do
    assert_difference('UserHistoryDetail.count') do
      post user_history_details_url, params: { user_history_detail: { symtptom_id: @user_history_detail.symtptom_id, user_history_id: @user_history_detail.user_history_id } }
    end

    assert_redirected_to user_history_detail_url(UserHistoryDetail.last)
  end

  test "should show user_history_detail" do
    get user_history_detail_url(@user_history_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_history_detail_url(@user_history_detail)
    assert_response :success
  end

  test "should update user_history_detail" do
    patch user_history_detail_url(@user_history_detail), params: { user_history_detail: { symtptom_id: @user_history_detail.symtptom_id, user_history_id: @user_history_detail.user_history_id } }
    assert_redirected_to user_history_detail_url(@user_history_detail)
  end

  test "should destroy user_history_detail" do
    assert_difference('UserHistoryDetail.count', -1) do
      delete user_history_detail_url(@user_history_detail)
    end

    assert_redirected_to user_history_details_url
  end
end
