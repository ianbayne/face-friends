Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :users, only: [:index, :show]

  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
