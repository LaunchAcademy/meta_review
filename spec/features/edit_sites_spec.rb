require 'rails_helper'

def sign_up
  visit root_path

  click_on 'Sign in'
  click_on 'Sign up'

  fill_in 'Email', with: 'peter@gmail.com'
  fill_in 'Password', with: 'password123'
  fill_in 'Password confirmation', with: 'password123'

  click_on 'Sign up'
end

def site_create
  visit new_site_path

  fill_in 'Title', with: 'GREAT SITE'
  fill_in 'Url', with: 'http://www.google.com'
  fill_in 'Description', with: 'check out this great search engine'
  click_on 'Create Site'
end

feature "Edit site" do
  scenario "user edits site succesfully" do
    sign_up
    site_create

    click_on 'Edit'

    fill_in 'Title', with: 'GREATEST SITE'
    fill_in 'Url', with: 'http://www.google.com/whoa'
    fill_in 'Description', with: 'check out this great search engine, it is awesome'
    click_on 'Update Site'

    expect(page).to have_content "Site updated successfully!"
  end

  scenario "user deletes title" do
    sign_up
    site_create

    click_on 'Edit'

    fill_in 'Title', with: ''
    click_on 'Update Site'

    expect(page).to have_content "can't be blank"
  end

  scenario "user deletes url" do
    sign_up
    site_create

    click_on 'Edit'

    fill_in 'Url', with: ''
    click_on 'Update Site'

    expect(page).to have_content "can't be blank"
  end

  scenario "user deletes description" do
    sign_up
    site_create

    click_on 'Edit'

    fill_in 'Description', with: ''
    click_on 'Update Site'

    expect(page).to have_content "can't be blank"
  end

end
