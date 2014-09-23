require 'rails_helper'

feature "Create site" do
  scenario "user creates site succesfully" do
    visit root_path

    click_on 'Sign in'
    click_on 'Sign up'

    fill_in 'Email', with: 'peter@gmail.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'

    click_on 'Sign up'

    visit new_site_path

    fill_in 'Title', with: 'GREAT SITE'
    fill_in 'Url', with: 'http://www.google.com'
    fill_in 'Description', with: 'check out this great search engine'
    click_on 'Create Site'

    expect(page).to have_content "hello"
  end

  # scenario "user signs up with invalid info" do
  #   visit new_user_registration_path

  #   click_on 'Sign up'

  #   expect(page).to have_content "errors prohibited this user from being saved"
  # end
end
