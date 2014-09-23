require 'rails_helper'

def sign_up
  visit root_path

  click_on 'Sign in'
  click_on 'Sign up'

  fill_in 'Email', with: 'peter@gmail.com'
  fill_in 'Password', with: 'password123'
  fill_in 'Password confirmation', with: 'password123'

  click_on 'Sign up'

  visit new_site_path
end

def site_create
  Site.create!(title: 'Dumb site',
      url: 'http://www.dumbsite.com',
      description: 'wicked dumb site, bro',
      user_id: 1)
end

def submit_description
  fill_in 'Description', with: 'check out this great dumb site'
  click_on 'Create Site'
end


feature "Create site" do
  scenario "user creates site succesfully" do
    sign_up

    fill_in 'Title', with: 'GREAT SITE'
    fill_in 'Url', with: 'http://www.google.com'
    fill_in 'Description', with: 'check out this great search engine'
    click_on 'Create Site'

    expect(page).to have_content "GREAT SITE"
  end

  scenario "user submits a duplicate site title" do
    site_create
    sign_up
    fill_in 'Title', with: 'Dumb site'
    fill_in 'Url', with: 'http://www.google.com'
    submit_description
    expect(page).to have_content "has already been taken"
  end

  scenario "user submits a duplicate site url" do
    site_create
    sign_up
    fill_in 'Title', with: 'Cool site'
    fill_in 'Url', with: 'http://www.dumbsite.com'
    submit_description
    expect(page).to have_content "has already been taken"
  end

  scenario "user submits a blank form" do
    sign_up

    click_on 'Create Site'

    expect(page).to have_content "can't be blank"
  end

  scenario "user submits a blank title" do
    sign_up
    fill_in 'Url', with: 'http://www.google.com'
    submit_description
    expect(page).to have_content "can't be blank"
  end

  scenario "user submits a blank url" do
    sign_up
    fill_in 'Title', with: 'GREAT SITE'
    submit_description
    expect(page).to have_content "can't be blank"
  end

  scenario "user submits a blank description" do
    sign_up
    fill_in 'Title', with: 'GREAT SITE'
    fill_in 'Url', with: 'http://www.google.com'
    click_on 'Create Site'

    expect(page).to have_content "can't be blank"
  end

end
