require "rails_helper"

feature "Authenticated user can create review on site" do
  scenario "User successfully creates a review for site" do
    @user = FactoryGirl.create(:user)
    @site = FactoryGirl.create(:site)
    sign_in_as(@user)
    visit new_site_review_path(@site)

    fill_in "Rating", with: "1"
    click_on "Create Review"

    expect(page).to have_content "1"
  end
end
