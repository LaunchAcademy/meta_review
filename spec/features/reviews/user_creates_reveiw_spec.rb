require "rails_helper"

def sign_up
  visit root_path

  click_on "Sign in"
  click_on "Sign up"

  fill_in "Email", with: "peter@gmail.com"
  fill_in "Password", with: "password123"
  fill_in "Password confirmation", with: "password123"

  click_on "Sign up"

  visit new_site_path
end

feature "Authenticated user can create review on site" do
  scenario "User successfully creates a review for site" do
    sign_up
    @user = User.create!(email: "surge@gmail.com", password: "password123")
    @site = @user.sites.create!(title: "shizz", url: "http://www.google.com", description: "This is the shizz")
    visit new_site_review_path(@site)

    fill_in "Rating", with: "1"
    click_on "Create Review"

    expect(page).to have_content "1"
  end
end
