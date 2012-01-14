require "spec_helper"

feature "Scales" do
  scenario "Viewing the Scales Page" do
    visit root_path
    navigate_to "Scales"
  end
end
