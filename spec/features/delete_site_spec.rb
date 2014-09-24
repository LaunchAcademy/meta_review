require "rails_helper"

feature "Delete site" do
  scenario "user creates site succesfully" do
    site = FactoryGirl.create(:site)
    user = site.user
    sign_in_as(user)

    visit site_path(site)

    click_on "Delete"

    expect(page).to have_content "Site destroyed successfully"
  end
end
