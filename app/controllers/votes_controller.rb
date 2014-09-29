class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @vote.review = Review.find(params[:review_id])
    @vote.user = current_user
    @vote.value = params[:value]
    if @vote.save
      redirect_to @vote.review.site
    else
      redirect_to Review.find(params[:review_id]).site
    end
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.value = params[:value]
    if @vote.save
      redirect_to @vote.review.site
    else
      redirect_to Review.find(params[:review_id]).site
    end
  end
end
