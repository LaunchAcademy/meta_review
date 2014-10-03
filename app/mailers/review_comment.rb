require 'mandrill'
class ReviewComment < ActionMailer::Base
  default from: "admin@meta-review.herokuapp.com"

  def comment(comment)
    @comment = comment
    @review = @comment.review
    @user = @review.user

    mail to: @user.email,
         subject: "Someone commented on your review!"
  end
end
