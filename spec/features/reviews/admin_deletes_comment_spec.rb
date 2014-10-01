require "rails_helper"

feature "Admin deletes review" do
  scenario "admin deletes review succesfully" do
    review = FactoryGirl.create(:review)
    admin_user = FactoryGirl.create(:user)
    admin_user.make_admin
    sign_in_as(admin_user)

      visit site_path(review.site)
      click_on "Delete Review"

    expect(page).to have_content "Review destroyed successfully"
  end
end
