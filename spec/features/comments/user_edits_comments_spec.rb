require "rails_helper"

feature "Edit comment" do
  scenario "user edit comment succesfully" do
    comment = FactoryGirl.create(:comment)
    sign_in_as(comment.user)

    visit edit_review_comment_path(comment.review, comment)

    fill_in "comment[body]", with: "Great!!!"
    click_button "Update Comment"

    expect(page).to have_content "Comment updated successfully!"
  end

  scenario "user edits comment unsuccesfully" do
    comment = FactoryGirl.create(:comment)
    sign_in_as(comment.user)

    visit edit_review_comment_path(comment.review, comment)

    fill_in "comment[body]", with: ""
    click_button "Update Comment"

    expect(page).to have_content "Body can't be blank"
  end

end
