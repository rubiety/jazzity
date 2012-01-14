require "spec_helper"

feature "Chords" do
  scenario "Viewing the Chords Page" do
    visit root_path
    navigate_to "Chords"
  end
end
