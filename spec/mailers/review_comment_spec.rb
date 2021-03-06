require "rails_helper"

RSpec.describe ReviewComment, type: :mailer do
  describe "comment" do
    let(:comment) { FactoryGirl.create(:comment) }
    let(:mail) { ReviewComment.comment(comment) }
    let(:review) { comment.review }
    let(:recipient) { review.user }
    let(:url) { site_path(review.site) }

    it "renders the headers" do
      expect(mail.subject).to eq("Someone commented on your review!")
      expect(mail.to).to eq([recipient.email])
      expect(mail.from).to eq(["admin@meta-review.herokuapp.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(comment.body)
    end

    it "has a link to view the comment" do
      expect(mail.body.encoded).to include(url)
    end
  end

end
