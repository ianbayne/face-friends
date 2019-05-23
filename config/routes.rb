Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :notifications, only: [:index]

  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users, only: [:index, :show] do
    resources :friendship_requests, only: [:create]
  end
  resources :friendship_requests, only: [:show] do
    post :accept
    post :deny
  end
end
