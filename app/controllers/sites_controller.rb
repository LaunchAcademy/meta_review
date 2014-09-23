class SitesController < ApplicationController

  def index
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.user = current_user
    if @site.errors.any?
      render "new"
    else
      @site.save
      redirect_to "/sites"
    end
  end

  private

  def site_params
    params.require(:site).permit(:title, :url, :description, :screenshot, :user_id)
  end

end
