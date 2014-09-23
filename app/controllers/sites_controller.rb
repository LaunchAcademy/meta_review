class SitesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def show
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
      redirect_to @site
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
