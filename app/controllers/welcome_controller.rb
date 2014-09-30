class WelcomeController < ApplicationController
  def index
    @sites = Site.order(created_at: :desc).limit(6)
  end
end
