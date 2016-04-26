Rails.application.routes.draw do
  resources :socks
  resources :orders
  resources :users

  root 'socks#index'
end
