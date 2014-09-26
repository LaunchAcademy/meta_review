require "rails_helper"

feature "Create comment" do
  scenario "user creates comment succesfully" do
    review = FactoryGirl.create(:review)
    site = review.site
    sign_in_as(review.user)

    visit new_review_comment_path(review)

    fill_in "comment[body]", with: "Great review!"
    click_button "Create Comment"

    expect(page).to have_content "Great review!"
  end

  scenario "user creates comment unsuccesfully" do
    review = FactoryGirl.create(:review)
    site = review.site
    sign_in_as(review.user)

    visit new_review_comment_path(review)

    fill_in "comment[body]", with: ""
    click_button "Create Comment"

    expect(page).to have_content "Body can't be blank"
  end

end
