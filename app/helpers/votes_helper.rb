module VotesHelper
  def change_review_vote_link_for(review, user)
    vote = review.vote_from(user)

    if vote.value == 1
      text = "Dislike"
      value = -1
    else
      text = "Like"
      value = 1
    end

    button_to text,
      review_vote_path(review, vote),
      method:
        :put,
        params: { value: value },
        class: "vote_button"
  end
end
