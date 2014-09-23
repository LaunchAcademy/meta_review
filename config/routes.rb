Rails.application.routes.draw do
  resources :reviews

  devise_for :users
  root to: 'welcome#index'

  resources :sites
end
