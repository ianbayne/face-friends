Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
end
