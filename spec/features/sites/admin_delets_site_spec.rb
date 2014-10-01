require "rails_helper"

feature "Admin deletes site" do
  scenario "admin deletes site succesfully" do
    site = FactoryGirl.create(:site)
    admin_user = FactoryGirl.create(:user)
    admin_user.make_admin
    sign_in_as(admin_user)

    visit site_path(site)
    save_and_open_page
    click_on "Delete"

    expect(page).to have_content "Site destroyed successfully!"
  end
end
