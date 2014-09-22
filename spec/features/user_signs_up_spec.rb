require 'rails_helper'

feature "User signs up" do
  scenario "user signs up successfully" do
    visit new_user_registration_path

    fill_in 'Email', with: 'frank@thetank.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    click_on 'Sign up'

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user signs up with invalid info" do
    visit new_user_registration_path

    click_on 'Sign up'

    expect(page).to have_content "errors prohibited this user from being saved"
  end
end
