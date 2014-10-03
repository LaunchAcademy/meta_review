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
      redirect_to @site, notice: "Review created successfully!"
    else
      render "reviews/new"
    end
  end

  def edit
    @site = Site.find(params[:site_id])
    @review = find_authorized_review
  end

  def update
    @site = Site.find(params[:site_id])
    @review = @site.reviews.find(params[:id])

    if @review.update(review_params)
      redirect_to @site, notice: "Review updated successfully!"
    else
      render "reviews/edit"
    end
  end

  def destroy
    @site = Site.find(params[:site_id])
    @review = find_authorized_review

    @review.destroy

    redirect_to site_path(@site), notice: "Review destroyed successfully!"
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

  def find_authorized_review
    if current_user.admin?
      Review.find(params[:id])
    else
       current_user.reviews.find(params[:id])
    end
  end
end
