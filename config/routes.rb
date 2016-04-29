Rails.application.routes.draw do

  mount Payola::Engine => '/payola', as: :payola
  resources :socks
  resources :orders
  resources :users
  resources :charges, only: [:new, :create]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :addresses

  root 'socks#index'
  get '/signup' => "users#new", as: :signup
  get '/login'  => "sessions#new", as: :login
  post '/login' => "sessions#create", as: :login_create
  get '/logout' => "sessions#destroy", as: :logout
  get '/search' => "search#index", as: :search
end
