Rails.application.routes.draw do
  get 'carts/new'
  post 'carts/create'
  get 'carts/show'
  devise_for :users
  root to: "home#index", as: 'home'

  resources :carts, only: [:new, :create, :show]
end
