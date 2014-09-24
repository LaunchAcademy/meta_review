require 'rails_helper'

def sign_up
  User.create!(email: "peter@gmail.com", password: "password123")
end

def site_create
  @user.sites.create!(title: 'Dumb site',
      url: 'http://www.dumbsite.com',
      description: 'wicked dumb site, bro')
end

def sign_in_as(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end

feature "Delete site" do
  scenario "user creates site succesfully" do
    @user = sign_up
    sign_in_as(@user)

    site = site_create

    visit site_path(site)
    click_on 'Delete'

    expect(page).to have_content "Site destroyed successfully"
  end
end
