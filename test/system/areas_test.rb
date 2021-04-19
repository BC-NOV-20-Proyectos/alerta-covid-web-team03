require "application_system_test_case"
#Test for AreasTest
class AreasTest < ApplicationSystemTestCase
  setup do
    @area = areas(:one)
  end

  test "visiting the index" do
    visit areas_url
    assert_selector "h1", text: "Areas"
  end

  test "creating a Area" do
    visit areas_url
    click_on "New Area"

    fill_in "Description", with: @area.description
    fill_in "Institution", with: @area.institution_id
    fill_in "Qrcode", with: @area.qrcode
    click_on "Create Area"

    assert_text "Area was successfully created"
    click_on "Back"
  end

  test "updating a Area" do
    visit areas_url
    click_on "Edit", match: :first

    fill_in "Description", with: @area.description
    fill_in "Institution", with: @area.institution_id
    fill_in "Qrcode", with: @area.qrcode
    click_on "Update Area"

    assert_text "Area was successfully updated"
    click_on "Back"
  end

  test "destroying a Area" do
    visit areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Area was successfully destroyed"
  end
end
