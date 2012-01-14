require "spec_helper"

feature "Progressions" do
  scenario "Viewing the Progressions Page" do
    visit root_path
    navigate_to "Progressions"
  end
end
