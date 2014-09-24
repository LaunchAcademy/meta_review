require "rails_helper"

feature "Create site" do
  scenario "user creates site succesfully" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit new_site_path

    fill_in "Title", with: "GREAT SITE"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "check out this great search engine"
    click_on "Create Site"

    expect(page).to have_content "GREAT SITE"
  end

  scenario "user submits a duplicate site title" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    FactoryGirl.create(:site)

    visit new_site_path

    fill_in "Title", with: "Google!"
    fill_in "Url", with: "http://www.gooogle.com"
    fill_in "Description", with: "It is a site"
    click_on "Create Site"

    expect(page).to have_content "has already been taken"
  end

  scenario "user submits a duplicate site url" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    FactoryGirl.create(:site)

    visit new_site_path

    fill_in "Title", with: "Cool site"
    fill_in "Url", with: "http://google.com"
    fill_in "Description", with: "It is a site"
    click_on "Create Site"

    expect(page).to have_content "has already been taken"
  end

  scenario "user submits a blank form" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit new_site_path

    click_on "Create Site"

    expect(page).to have_content "can't be blank"
  end

  scenario "user submits a blank title" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit new_site_path

    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "It is a site"
    click_on "Create Site"

    expect(page).to have_content "can't be blank"
  end

  scenario "user submits a blank url" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit new_site_path

    fill_in "Title", with: "GREAT SITE"
    fill_in "Description", with: "It is a site"
    click_on "Create Site"

    expect(page).to have_content "can't be blank"
  end

  scenario "user submits a blank description" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit new_site_path

    fill_in "Title", with: "GREAT SITE"
    fill_in "Url", with: "It is a site"
    click_on "Create Site"

    expect(page).to have_content "can't be blank"
  end

end
