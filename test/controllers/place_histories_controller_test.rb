require "test_helper"

class PlaceHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place_history = place_histories(:one)
  end

  test "should get index" do
    get place_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_place_history_url
    assert_response :success
  end

  test "should create place_history" do
    assert_difference('PlaceHistory.count') do
      post place_histories_url, params: { place_history: { date: @place_history.date, place_id: @place_history.place_id, user_id: @place_history.user_id } }
    end

    assert_redirected_to place_history_url(PlaceHistory.last)
  end

  test "should show place_history" do
    get place_history_url(@place_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_history_url(@place_history)
    assert_response :success
  end

  test "should update place_history" do
    patch place_history_url(@place_history), params: { place_history: { date: @place_history.date, place_id: @place_history.place_id, user_id: @place_history.user_id } }
    assert_redirected_to place_history_url(@place_history)
  end

  test "should destroy place_history" do
    assert_difference('PlaceHistory.count', -1) do
      delete place_history_url(@place_history)
    end

    assert_redirected_to place_histories_url
  end
end
