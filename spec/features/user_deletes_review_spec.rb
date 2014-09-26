require "rails_helper"

feature "Delete site" do
  scenario "user deletes review succesfully" do
    review = FactoryGirl.create(:review)
    sign_in_as(review.user)

    visit site_path(review.site)

    click_on "Delete"

    expect(page).to have_content "Review destroyed successfully"
  end
end
