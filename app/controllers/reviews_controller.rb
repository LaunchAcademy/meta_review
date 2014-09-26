class ReviewsController < ApplicationController
  before_action :authenticate_user!

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
      render "reviews/new"
    end
  end

  def edit
    @site = Site.find(params[:site_id])
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @site = Site.find(params[:site_id])
    @review = @site.reviews.find(params[:id])

    if @review.update(review_params)
      redirect_to @site
    else
      render "reviews/edit"
    end
  end

  def destroy
    @site = Site.find(params[:site_id])
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to site_path(@site)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
