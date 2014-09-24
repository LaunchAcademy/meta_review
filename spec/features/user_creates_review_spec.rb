require 'rails_helper'

feature "User creates a review" do
  scenario "user successfully creates a review" do
    user = User.create!(email: 'hello@world.com', password: 'password123')
    site = Site.create!(title: 'Hello World', url: 'http://google.com',
      description: 'search for anything', user: user)

    sign_in_as(user)

    visit site_path(site)
    fill_in "Rating", with: 5
  click_on "Create Review"

    expect(page).to have_content "Review created successfully!"
  end

  scenario "user attempts to creates a review with invalid info"

  def sign_in_as(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
  end
end
