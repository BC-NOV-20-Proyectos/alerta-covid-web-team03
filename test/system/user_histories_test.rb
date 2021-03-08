require "application_system_test_case"

class UserHistoriesTest < ApplicationSystemTestCase
  setup do
    @user_history = user_histories(:one)
  end

  test "visiting the index" do
    visit user_histories_url
    assert_selector "h1", text: "User Histories"
  end

  test "creating a User history" do
    visit user_histories_url
    click_on "New User History"

    fill_in "Date", with: @user_history.date
    fill_in "User", with: @user_history.user_id
    click_on "Create User history"

    assert_text "User history was successfully created"
    click_on "Back"
  end

  test "updating a User history" do
    visit user_histories_url
    click_on "Edit", match: :first

    fill_in "Date", with: @user_history.date
    fill_in "User", with: @user_history.user_id
    click_on "Update User history"

    assert_text "User history was successfully updated"
    click_on "Back"
  end

  test "destroying a User history" do
    visit user_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User history was successfully destroyed"
  end
end
