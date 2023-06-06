Rails.application.routes.draw do
  root to: 'places#index'

  resources :places
  resources :posts

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
end

