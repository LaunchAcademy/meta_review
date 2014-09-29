require "rails_helper"

feature "Authenticated user can create review on site" do
  scenario "User successfully creates a review for site" do
    user = FactoryGirl.create(:user)
    site = FactoryGirl.create(:site)
    sign_in_as(user)
<<<<<<< HEAD
=======
    visit new_site_review_path(site)
>>>>>>> c1efcdce5bac58bec7746720d59fbce1210a4fed

    visit new_site_review_path(site)
    fill_in "Rating", with: "1"
    click_on "Create Review"

    expect(page).to have_content "1"
  end

  scenario "User fails to creates a review for site-blank rating" do
    user = FactoryGirl.create(:user)
    site = FactoryGirl.create(:site)
    sign_in_as(user)
    visit new_site_review_path(site)

    fill_in "Rating", with: ""
    click_on "Create Review"

    expect(page).to have_content "Rating can't be blank"
  end

  scenario "User fails to creates a review for site- rating over 5" do
    user = FactoryGirl.create(:user)
    site = FactoryGirl.create(:site)
    sign_in_as(user)
    visit new_site_review_path(site)

    fill_in "Rating", with: "6"
    click_on "Create Review"

    expect(page).to have_content "Rating must be less than or equal to 5"
  end

  scenario "User fails to creates a review for site- rating under 1" do
    user = FactoryGirl.create(:user)
    site = FactoryGirl.create(:site)
    sign_in_as(user)
    visit new_site_review_path(site)

    fill_in "Rating", with: "0"
    click_on "Create Review"

    expect(page).to have_content "Rating must be greater than or equal to 1"
  end

  scenario "User fails to creates a review for site- rating under 1" do
    user = FactoryGirl.create(:user)
    site = FactoryGirl.create(:site)
    sign_in_as(user)
    visit new_site_review_path(site)

    fill_in "Rating", with: "1.5"
    click_on "Create Review"

    expect(page).to have_content "Rating must be an integer"
  end
end
