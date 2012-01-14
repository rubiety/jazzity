require "spec_helper"

feature "Discussions" do
  scenario "Viewing the Discussions Page" do
    visit root_path
    navigate_to "Discussion"
  end
end
