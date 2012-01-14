require "spec_helper"

feature "Home" do
  scenario "Viewing the Home Page" do
    visit root_path
  end
end
