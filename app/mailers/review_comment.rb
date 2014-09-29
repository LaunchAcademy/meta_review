class ReviewComment < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_comment.comment.subject
  #
  def comment(comment)
    @comment = comment
    @user = @comment.review.user
    @url = "http://meta-review.herokuapp.com/"

    mail to: @user.email,
      subject: "Someone commented on your review!"
  end
end

