require "rails_helper"

feature "Authenticated user can edit review on site" do
  scenario "User successfully edits a review for site" do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit edit_site_review_path(review.site, review)
    fill_in "Rating", with: "1"
    click_on "Update Review"

    expect(page).to have_content "1"
  end

  scenario "User fails to update a review for site-blank rating" do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit edit_site_review_path(review.site, review)

    fill_in "Rating", with: ""
    click_on "Update Review"

    expect(page).to have_content "can't be blank"
  end

  scenario "User fails to update a review for site-rating over 5" do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit edit_site_review_path(review.site, review)

    fill_in "Rating", with: "6"
    click_on "Update Review"

    expect(page).to have_content "must be less than or equal to 5"
  end

  scenario "User fails to update a review for site-rating under 1" do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit edit_site_review_path(review.site, review)

    fill_in "Rating", with: "0"
    click_on "Update Review"

    expect(page).to have_content "must be greater than or equal to 1"
  end
end
