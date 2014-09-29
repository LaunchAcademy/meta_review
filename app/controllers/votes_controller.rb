class VotesController < ApplicationController
  def show
  end

  def new
    @vote = Vote.new
    @vote.review = Review.find(params[:review_id])
    @vote.user = current_user
    @vote.value = 1 if params[:value].to_i >= 1
    @vote.value = -1 if params[:value].to_i <= -1
    if @vote.save
      redirect_to @vote.review.site
    else
      redirect_to Review.find(params[:review_id]).site
    end
  end

  def create
    binding.pry
  end

  def edit
  end

  def delete
  end
end
