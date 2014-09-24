class SitesController < ApplicationController
  before_action :authenticate_user!,
    only: [:new, :create, :update, :edit, :destroy]

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    @image = Cloudinary::Uploader.explicit("http://www.launchacademy.com",
  :type => "url2png", :api_key => "142685223365569", :api_secret => "QBEEVDnaVq-ZAPiD6RZKOIXiuE8",
  :cloud_name => "djbfyo90r")
  end

  def new
    @site = Site.new
  end

  def create
    @site = current_user.sites.build(site_params)

    if @site.save
      redirect_to @site, notice: 'Site created successfully!'
    else
      render "new"
    end
  end

  def edit
    @site = current_user.sites.find(params[:id])
  end

  def update
    @site = current_user.sites.find(params[:id])

    if @site.update(site_params)
      redirect_to @site, notice: 'Site updated successfully!'
    else
      render 'edit'
    end
  end

  def destroy
    @site = current_user.sites.find(params[:id])

    @site.destroy

    redirect_to sites_path, notice: 'Site destroyed successfully!'
  end

  private

  def site_params
    params.require(:site).permit(:title, :url, :description, :screenshot)
  end

end
