Rails.application.routes.draw do

  get 'order/create'
  #resources :cart
  #get 'cart/create/:id', to: 'cart#create', as: 'ajouter_panier'
  get 'cart/:id/create', to: 'cart#create', as: "cart_create"
  get 'cart/cat', to: 'cart#cart', as: "cart"
  #DELETE /articles/:id(.:format)      articles#destroy
  delete 'cart/cat/:id', to: 'cart#destroy', as: 'delete_cart'
  devise_for :users
  resources :items

  root to: "home#index"
  get 'home/mailer', to: 'home#mailer', as: 'panier'
  #ressouces :contacts
end

