require "test_helper"
#Test for InsititutionsControllerTest
class InsititutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insititution = insititutions(:one)
  end

  test "should get index" do
    get insititutions_url
    assert_response :success
  end

  test "should get new" do
    get new_insititution_url
    assert_response :success
  end

  test "should create insititution" do
    assert_difference('Insititution.count') do
      post insititutions_url, params: { insititution: { description: @insititution.description } }
    end

    assert_redirected_to insititution_url(Insititution.last)
  end

  test "should show insititution" do
    get insititution_url(@insititution)
    assert_response :success
  end

  test "should get edit" do
    get edit_insititution_url(@insititution)
    assert_response :success
  end

  test "should update insititution" do
    patch insititution_url(@insititution), params: { insititution: { description: @insititution.description } }
    assert_redirected_to insititution_url(@insititution)
  end

  test "should destroy insititution" do
    assert_difference('Insititution.count', -1) do
      delete insititution_url(@insititution)
    end

    assert_redirected_to insititutions_url
  end
end
