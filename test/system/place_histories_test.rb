require "application_system_test_case"
#Test for PlaceHistoriesTest
class PlaceHistoriesTest < ApplicationSystemTestCase
  setup do
    @place_history = place_histories(:one)
  end

  test "visiting the index" do
    visit place_histories_url
    assert_selector "h1", text: "Place Histories"
  end

  test "creating a Place history" do
    visit place_histories_url
    click_on "New Place History"

    fill_in "Date", with: @place_history.date
    fill_in "Place", with: @place_history.place_id
    fill_in "User", with: @place_history.user_id
    click_on "Create Place history"

    assert_text "Place history was successfully created"
    click_on "Back"
  end

  test "updating a Place history" do
    visit place_histories_url
    click_on "Edit", match: :first

    fill_in "Date", with: @place_history.date
    fill_in "Place", with: @place_history.place_id
    fill_in "User", with: @place_history.user_id
    click_on "Update Place history"

    assert_text "Place history was successfully updated"
    click_on "Back"
  end

  test "destroying a Place history" do
    visit place_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place history was successfully destroyed"
  end
end
