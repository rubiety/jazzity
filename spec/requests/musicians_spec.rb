require "spec_helper"

feature "Musicians" do
  scenario "Viewing the Musicians Page" do
    visit root_path
    navigate_to "Musicians"
  end
end
