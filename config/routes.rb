Rails.application.routes.draw do
  root to: 'top#index'
  resources :photos
  resources :towns, only: [:show, :index]
  resources :wards, only: [:show, :index]
  resources :users, only: [:show]
end
