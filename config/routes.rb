Rails.application.routes.draw do

  resources :socks
  resources :orders
  resources :users
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root 'socks#index'
  get '/signup' => "users#new", as: :signup
  get '/login'  => "sessions#new", as: :login
  post '/login' => "sessions#create", as: :login_create
  get '/logout' => "sessions#destroy", as: :logout
  get '/search' => "search#index", as: :search
  get '/filter/:filter(.:format)', :to => 'search#index', as: :filter
end
