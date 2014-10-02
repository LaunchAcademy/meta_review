require "rails_helper"

feature "Delete comment" do
  scenario "user deletes site succesfully" do
    comment = FactoryGirl.create(:comment)
    site = comment.review.site
    sign_in_as(comment.user)

    visit site_path(site)

    click_on "Delete"

    expect(page).to have_content "Comment destroyed successfully!"
  end
end
