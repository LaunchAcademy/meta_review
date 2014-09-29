Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :sites do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy] do
      resources :votes
    end
  end
end
