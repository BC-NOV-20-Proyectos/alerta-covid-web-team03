require "test_helper"

class AreaHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_history = area_histories(:one)
  end

  test "should get index" do
    get area_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_area_history_url
    assert_response :success
  end

  test "should create area_history" do
    assert_difference('AreaHistory.count') do
      post area_histories_url, params: { area_history: { date: @area_history.date, user_id: @area_history.user_id } }
    end

    assert_redirected_to area_history_url(AreaHistory.last)
  end

  test "should show area_history" do
    get area_history_url(@area_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_history_url(@area_history)
    assert_response :success
  end

  test "should update area_history" do
    patch area_history_url(@area_history), params: { area_history: { date: @area_history.date, user_id: @area_history.user_id } }
    assert_redirected_to area_history_url(@area_history)
  end

  test "should destroy area_history" do
    assert_difference('AreaHistory.count', -1) do
      delete area_history_url(@area_history)
    end

    assert_redirected_to area_histories_url
  end
end
