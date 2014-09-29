require "rails_helper"

feature "Authenticated user can edit review on site" do
  scenario "User successfully edits a review for site" do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit edit_site_review_path(review.site, review)
    choose "review_rating_1"
    click_on "Update Review"

    expect(page).to have_content "1"
  end
end
