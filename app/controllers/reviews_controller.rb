class ReviewsController < ApplicationController
<<<<<<< HEAD
  def show
  end

  def new
=======
  before_action :authenticate_user!
  def new
    @site = Site.find(params[:site_id])
>>>>>>> 70bc5413c4f12f7323a434c79b192a40e5d646db
    @review = Review.new
  end

  def create
<<<<<<< HEAD
    #save isn't working
    #fix to launch
    #also create uiniquess assiotation in the schema




    @site = Site.find(params[:site_id])
    @review = Review.new(review_params)
    @review.site = @site
    @review.user = current_user

    if @review.save
      redirect site_path(@site)
    else
      binding.pry
=======
    @site = Site.find(params[:site_id])
    @review = @site.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @site
    else
      render "reviews/new"
>>>>>>> 70bc5413c4f12f7323a434c79b192a40e5d646db
    end
  end

  def edit
<<<<<<< HEAD
  end

  def delete
=======
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
>>>>>>> 70bc5413c4f12f7323a434c79b192a40e5d646db
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
<<<<<<< HEAD

=======
>>>>>>> 70bc5413c4f12f7323a434c79b192a40e5d646db
end
