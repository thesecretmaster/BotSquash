require "application_system_test_case"

class BotsTest < ApplicationSystemTestCase
  setup do
    @bot = bots(:one)
  end

  test "visiting the index" do
    visit bots_url
    assert_selector "h1", text: "Bots"
  end

  test "creating a Bot" do
    visit bots_url
    click_on "New Bot"

    click_on "Create Bot"

    assert_text "Bot was successfully created"
    click_on "Back"
  end

  test "updating a Bot" do
    visit bots_url
    click_on "Edit", match: :first

    click_on "Update Bot"

    assert_text "Bot was successfully updated"
    click_on "Back"
  end

  test "destroying a Bot" do
    visit bots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bot was successfully destroyed"
  end
end
