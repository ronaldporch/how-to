require "test_helper"

feature "MakeNewHowTo" do
  scenario "making a new howto" do
    visit howtos_path
    fill_in "howto_content", with: howtos(:one).content
    click_on "Create Howto"
    page.text.must_include howtos(:one).content
  end

  scenario "incorrectly making new howto" do
    visit howtos_path
    click_on "Create Howto"
    page.text.must_include "Doing"
  end
end
