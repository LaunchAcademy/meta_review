class ReviewsController < ApplicationController
  def show
  end

  def new
    @review = Review.new
  end

  def create
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
