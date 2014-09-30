require "rails_helper"

RSpec.describe ReviewComment, :type => :mailer do
  describe "comment" do
    let(:mail) { ReviewComment.comment }

    it "renders the headers" do
      expect(mail.subject).to eq("Someone commented on your review!")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
