Rails.application.routes.draw do

  get 'order/create'
  get 'cart/create'
  get 'carts/add/:id', to: 'carts#add', as: 'add'
  devise_for :users
  resources :items

  resources :carts, only: [:new, :create, :show]
  root to: "home#index"
  get 'home/mailer', to: 'home#mailer', as: 'panier'
  #ressouces :contacts
end

