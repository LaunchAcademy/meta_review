require "rails_helper"

feature "Admin deletes comment" do
  scenario "admin deletes comment succesfully" do
    comment = FactoryGirl.create(:comment)
    admin_user = FactoryGirl.create(:user)
    admin_user.admin = true
    sign_in_as(admin_user)

    visit site_path(comment.site)

    click_on "Delete"

    expect(page).to have_content "Comment destroyed successfully!"
  end
end
