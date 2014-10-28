require "test_helper"

feature "MakeNewSteps" do
  scenario "Making new Steps" do
    visit howto_path(howtos(:one))
    page.text.must_include howtos(:one).content
  end
end
