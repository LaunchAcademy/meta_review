module VotesHelper
  def change_review_vote_link_for(review, user)
    vote = review.vote_from(user)

    if vote.value == 1
      text = "Downvote"
      value = -1
    else
      text = "Up"
      value = 1
    end

    button_to text,
      review_vote_path(review, vote),
      method:
        :put,
        params: { value: value },
      class: "button"
  end
end
