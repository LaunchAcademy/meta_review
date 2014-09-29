class ReviewComment < ActionMailer::Base
  default from: "frank@thetank.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_comment.comment.subject
  #
  def comment
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
