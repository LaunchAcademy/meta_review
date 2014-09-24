require 'rails_helper'

feature "Edit site" do
  scenario "user edits site succesfully" do
    site = FactoryGirl.create(:site)
    user = site.user
    sign_in_as(user)

    visit site_path(site)

    click_on 'Edit'

    fill_in 'Title', with: 'GREATEST SITE'
    fill_in 'Url', with: 'http://www.google.com/whoa'
    fill_in 'Description', with: 'check out this great search engine, it is awesome'
    click_on 'Update Site'

    expect(page).to have_content "Site updated successfully!"
  end

  scenario "user deletes title" do
    site = FactoryGirl.create(:site)
    user = site.user
    sign_in_as(user)

    visit site_path(site)

    click_on 'Edit'

    fill_in 'Title', with: ''
    click_on 'Update Site'

    expect(page).to have_content "can't be blank"
  end

  scenario "user deletes url" do
    site = FactoryGirl.create(:site)
    user = site.user
    sign_in_as(user)

    visit site_path(site)

    click_on 'Edit'

    fill_in 'Url', with: ''
    click_on 'Update Site'

    expect(page).to have_content "can't be blank"
  end

  scenario "user deletes description" do
    site = FactoryGirl.create(:site)
    user = site.user
    sign_in_as(user)

    visit site_path(site)

    click_on 'Edit'

    fill_in 'Description', with: ''
    click_on 'Update Site'

    expect(page).to have_content "can't be blank"
  end

end
