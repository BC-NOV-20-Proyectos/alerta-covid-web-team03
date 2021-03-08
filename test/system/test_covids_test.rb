require "application_system_test_case"

class TestCovidsTest < ApplicationSystemTestCase
  setup do
    @test_covid = test_covids(:one)
  end

  test "visiting the index" do
    visit test_covids_url
    assert_selector "h1", text: "Test Covids"
  end

  test "creating a Test covid" do
    visit test_covids_url
    click_on "New Test Covid"

    fill_in "Date did", with: @test_covid.date_did
    fill_in "Date get result", with: @test_covid.date_get_result
    check "Had symptoms" if @test_covid.had_symptoms
    check "Result" if @test_covid.result
    fill_in "Type test", with: @test_covid.type_test
    click_on "Create Test covid"

    assert_text "Test covid was successfully created"
    click_on "Back"
  end

  test "updating a Test covid" do
    visit test_covids_url
    click_on "Edit", match: :first

    fill_in "Date did", with: @test_covid.date_did
    fill_in "Date get result", with: @test_covid.date_get_result
    check "Had symptoms" if @test_covid.had_symptoms
    check "Result" if @test_covid.result
    fill_in "Type test", with: @test_covid.type_test
    click_on "Update Test covid"

    assert_text "Test covid was successfully updated"
    click_on "Back"
  end

  test "destroying a Test covid" do
    visit test_covids_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test covid was successfully destroyed"
  end
end
