require "application_system_test_case"

class UserHistoryDetailsTest < ApplicationSystemTestCase
  setup do
    @user_history_detail = user_history_details(:one)
  end

  test "visiting the index" do
    visit user_history_details_url
    assert_selector "h1", text: "User History Details"
  end

  test "creating a User history detail" do
    visit user_history_details_url
    click_on "New User History Detail"

    fill_in "Symtptom", with: @user_history_detail.symtptom_id
    fill_in "User history", with: @user_history_detail.user_history_id
    click_on "Create User history detail"

    assert_text "User history detail was successfully created"
    click_on "Back"
  end

  test "updating a User history detail" do
    visit user_history_details_url
    click_on "Edit", match: :first

    fill_in "Symtptom", with: @user_history_detail.symtptom_id
    fill_in "User history", with: @user_history_detail.user_history_id
    click_on "Update User history detail"

    assert_text "User history detail was successfully updated"
    click_on "Back"
  end

  test "destroying a User history detail" do
    visit user_history_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User history detail was successfully destroyed"
  end
end
