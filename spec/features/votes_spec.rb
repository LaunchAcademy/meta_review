require "rails_helper"

feature "Authenticated user can vote" do
  scenario "User Likes and inreases the votes by 1" do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit site_path(review.site)
    click_on "Like"
    expect(page).to have_content "Likes: 1"
  end
  scenario "User DisLike and decreases the votes by 1" do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit site_path(review.site)
    click_on "Dislike"
    expect(page).to have_content "Likes: -1"
  end
end
