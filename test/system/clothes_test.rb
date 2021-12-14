require "application_system_test_case"

class ClothesTest < ApplicationSystemTestCase
  setup do
    @clothe = clothes(:one)
  end

  test "visiting the index" do
    visit clothes_url
    assert_selector "h1", text: "Clothes"
  end

  test "creating a Clothe" do
    visit clothes_url
    click_on "New Clothe"

    fill_in "Clothing category", with: @clothe.clothing_category
    fill_in "Color", with: @clothe.color
    fill_in "Occasion", with: @clothe.occasion
    fill_in "Quadrant", with: @clothe.quadrant
    fill_in "User", with: @clothe.user_id
    click_on "Create Clothe"

    
    click_on "Back"
  end

  test "updating a Clothe" do
    visit clothes_url
    click_on "Edit", match: :first

    fill_in "Clothing category", with: @clothe.clothing_category
    fill_in "Color", with: @clothe.color
    fill_in "Occasion", with: @clothe.occasion
    fill_in "Quadrant", with: @clothe.quadrant
    fill_in "User", with: @clothe.user_id
    click_on "Update Clothe"

    
    click_on "Back"
  end

  test "destroying a Clothe" do
    visit clothes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    
  end
end
