Rails.application.routes.draw do
  root to: 'top#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'

  resources :photos
  resources :towns, only: [:show, :index]
  resources :wards, only: [:show, :index]
  resources :users, only: [:show]
end
