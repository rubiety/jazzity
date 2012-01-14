require "spec_helper"

feature "Concepts" do
  scenario "Viewing the Concepts Page" do
    visit root_path
    navigate_to "Concepts"
  end
end
