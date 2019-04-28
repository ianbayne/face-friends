Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :posts, only: [:create, :edit, :update, :destroy]
end
