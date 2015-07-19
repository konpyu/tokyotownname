Rails.application.routes.draw do
  root to: 'top#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'

  get 'achieve', to: 'pages#achieve'
  get 'about',   to: 'pages#about'

  resources :lives, only: [:create, :destroy]
  resources :photos
  resources :towns, only: [:show, :index]
  resources :wards, only: [:show, :index]
  resources :users, only: [:show]
end
