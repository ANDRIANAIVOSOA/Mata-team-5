Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/mailer', to: 'home#mailer', as: 'panier'
  #ressouces :contacts
end
