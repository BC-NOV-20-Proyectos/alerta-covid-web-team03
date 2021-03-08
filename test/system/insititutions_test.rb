require "application_system_test_case"

class InsititutionsTest < ApplicationSystemTestCase
  setup do
    @insititution = insititutions(:one)
  end

  test "visiting the index" do
    visit insititutions_url
    assert_selector "h1", text: "Insititutions"
  end

  test "creating a Insititution" do
    visit insititutions_url
    click_on "New Insititution"

    fill_in "Description", with: @insititution.description
    click_on "Create Insititution"

    assert_text "Insititution was successfully created"
    click_on "Back"
  end

  test "updating a Insititution" do
    visit insititutions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @insititution.description
    click_on "Update Insititution"

    assert_text "Insititution was successfully updated"
    click_on "Back"
  end

  test "destroying a Insititution" do
    visit insititutions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Insititution was successfully destroyed"
  end
end
