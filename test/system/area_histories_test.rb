require "application_system_test_case"

class AreaHistoriesTest < ApplicationSystemTestCase
  setup do
    @area_history = area_histories(:one)
  end

  test "visiting the index" do
    visit area_histories_url
    assert_selector "h1", text: "Area Histories"
  end

  test "creating a Area history" do
    visit area_histories_url
    click_on "New Area History"

    fill_in "Date", with: @area_history.date
    fill_in "User", with: @area_history.user_id
    click_on "Create Area history"

    assert_text "Area history was successfully created"
    click_on "Back"
  end

  test "updating a Area history" do
    visit area_histories_url
    click_on "Edit", match: :first

    fill_in "Date", with: @area_history.date
    fill_in "User", with: @area_history.user_id
    click_on "Update Area history"

    assert_text "Area history was successfully updated"
    click_on "Back"
  end

  test "destroying a Area history" do
    visit area_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Area history was successfully destroyed"
  end
end
