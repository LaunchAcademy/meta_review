class ReviewsController < ApplicationController
  def show
  end

  def new
    @site = Site.find(params[:site_id])
    @review = Review.new
  end

  def create
    @site = Site.find(params[:site_id])
    @review = @site.reviews.build(review_params)
    @review.user = current_user
      if @review.save
      redirect_to @site
     else
      render 'reviews/new'
    end
  end

  def edit
  end

  def delete
  end

  private
  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
