class SitesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit,
    :destroy]

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.user = current_user

    if @site.save
      redirect_to @site
    else
      render "new"
    end

  end

  # def upload
  #   uploaded_io = params[:site][:screenshot]
  #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  #     file.write(uploaded_io.read)
  #   end
  # end

  private

  def site_params
    params.require(:site).permit(:title, :url, :description, :screenshot, :user_id)
  end

end
