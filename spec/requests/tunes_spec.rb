require "spec_helper"

feature "Tunes" do
  scenario "Viewing the Tunes Page" do
    visit root_path
    navigate_to "Tunes"
  end
end
