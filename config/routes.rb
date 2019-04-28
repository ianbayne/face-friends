Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :posts, only: [:show, :create, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
end
