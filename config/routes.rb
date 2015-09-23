Rails.application.routes.draw do
  root to: 'top#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'

  get 'achieve', to: 'pages#achieve'
  get 'about',   to: 'pages#about'
  get 'mypage',   to: 'pages#mypage'

  resources :lives do
    collection do
      post :toggle, to: "lives#toggle_lives"
    end
  end
  resources :photos do
    collection do
      post :upload, to: 'photos#upload'
    end
  end
  resources :towns, only: [:show, :index]
  resources :wards, only: [:show, :index]
  resources :users, only: [:show, :index]
  resources :comments
end
