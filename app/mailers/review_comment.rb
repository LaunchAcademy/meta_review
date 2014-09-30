class ReviewComment < ActionMailer::Base
  default from: "admin@meta-review.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_comment.comment.subject
  #
  def comment(comment)
    @comment = comment
    @user = @comment.review.user
    @url = "http://meta-review.herokuapp.com/site/#{@comment.review.id}"

    mail to: @user.email,
      subject: "Someone commented on your review!"
  end
end

