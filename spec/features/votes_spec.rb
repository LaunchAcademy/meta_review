require "rails_helper"

feature "Authenticated user can vote" do
  scenario "User upvotes and inreases the votes by 1" do
      review = FactoryGirl.create(:review)
      sign_in_as(review.user)

      visit site_path(review.site)
      click_on "Upvote"
      expect(page).to have_content "Likes: 1"
  end
  scenario "User downvotes and decreases the votes by 1" do
        review = FactoryGirl.create(:review)
        sign_in_as(review.user)

        visit site_path(review.site)
        click_on "Downvote"
        expect(page).to have_content "Likes: -1"

  end
end
