class SitesController < ApplicationController
  before_action :authenticate_user!,
    only: [:new, :create, :update, :edit, :destroy]

  def index
    @sites = Site.search(params[:search]).order(:title).page(params[:page])
  end

  def show
    @site = Site.find(params[:id])
    @reviews = Review.includes(:user, comments: :user).order(:body).page params[:page]

    if current_user
      @user_review = @site.reviews.find_by(user: current_user)
    end
  end

  def new
    @site = Site.new
  end

  def create
    @site = current_user.sites.build(site_params)
    if @site.save
      @site.update(screenshot: StwEngine::Helpers::Common.stw_show_url(@site.url))
      redirect_to @site, notice: 'Site created successfully!'
    else
      render "new"
    end
  end

  def edit
    @site = site_assigner
  end

  def update
    @site = site_assigner

    if @site.update(site_params)
      redirect_to @site, notice: 'Site updated successfully!'
    else
      render 'edit'
    end
  end

  def destroy
    @site = site_assigner
    @site.destroy

    redirect_to sites_path, notice: 'Site destroyed successfully!'
  end

  private

  def site_params
    params.require(:site).permit(:title, :url, :description)
  end

  def site_assigner
    current_user.admin ? Site.find(params[:id]) :
    current_user.sites.find(params[:id]) ##redundency for safty
  end

end
