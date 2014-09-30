Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#index'

  mount StwEngine::Engine => "/stw_engine"

  resources :sites do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :reviews, only: [] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
end
