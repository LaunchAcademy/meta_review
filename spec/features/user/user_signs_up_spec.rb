
require "rails_helper"
require "capybara/rails"

feature "User signs up" do
  scenario "user signs up successfully" do
    visit new_user_registration_path

    fill_in "Email", with: "frank@thetank.com"
    fill_in "Username", with: "frankthetank"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"

    within("#new_user") do
      click_on "Sign up"
    end
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user signs up with invalid info" do
    visit new_user_registration_path

    within("#new_user") do
      click_on "Sign up"
    end

    expect(page).to have_content "errors prohibited this user from being saved"
  end
end
