require "test_helper"

class TestCovidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_covid = test_covids(:one)
  end

  test "should get index" do
    get test_covids_url
    assert_response :success
  end

  test "should get new" do
    get new_test_covid_url
    assert_response :success
  end

  test "should create test_covid" do
    assert_difference('TestCovid.count') do
      post test_covids_url, params: { test_covid: { date_did: @test_covid.date_did, date_get_result: @test_covid.date_get_result, had_symptoms: @test_covid.had_symptoms, result: @test_covid.result, type_test: @test_covid.type_test } }
    end

    assert_redirected_to test_covid_url(TestCovid.last)
  end

  test "should show test_covid" do
    get test_covid_url(@test_covid)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_covid_url(@test_covid)
    assert_response :success
  end

  test "should update test_covid" do
    patch test_covid_url(@test_covid), params: { test_covid: { date_did: @test_covid.date_did, date_get_result: @test_covid.date_get_result, had_symptoms: @test_covid.had_symptoms, result: @test_covid.result, type_test: @test_covid.type_test } }
    assert_redirected_to test_covid_url(@test_covid)
  end

  test "should destroy test_covid" do
    assert_difference('TestCovid.count', -1) do
      delete test_covid_url(@test_covid)
    end

    assert_redirected_to test_covids_url
  end
end
