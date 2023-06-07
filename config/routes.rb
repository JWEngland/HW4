Rails.application.routes.draw do
  root 'places#index'
  resources :places

  resources :places do
    resources :posts, only: [:new, :create]
  end

  resources :user_sessions, only: [:new, :create, :destroy]

  get '/login', to: 'user_sessions#new', as: 'login'
  post '/login', to: 'user_sessions#create'
  get '/logout', to: 'user_sessions#destroy', as: :logout

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
end
