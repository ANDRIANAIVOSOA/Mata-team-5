Rails.application.routes.draw do
  get 'carts/new'
  post 'carts/create'
  get 'carts/show'
  get 'carts/add/:id', to: 'carts#add', as: 'add'
  devise_for :users
  root to: "home#index", as: 'home'
  resources :items

  resources :carts, only: [:new, :create, :show]
end

