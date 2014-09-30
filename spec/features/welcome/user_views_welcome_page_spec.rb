require "rails_helper"
require "capybara/rails"

feature "User views welcome page" do
  scenario "user sees most recent screenshots" do
    visit root_path
    expect(page).to have_selector(".screenshot")
  end

  # scenario "user can click on most recent screenshots to get to review page" do
  #   visit root_path

  #   click_link "sites"

  #   expect(page).to have_content "Reviews"
  # end
end
