Rails.application.routes.draw do
  get 'carts/show'

  resources :socks
  resources :orders
  resources :users
  resource :cart, only: [:show]

  root 'socks#index'
  get '/signup' => "users#new", as: :signup
  get '/login'  => "sessions#new", as: :login
  post '/login' => "sessions#create", as: :login_create
  get '/logout' => "sessions#destroy", as: :logout

end
