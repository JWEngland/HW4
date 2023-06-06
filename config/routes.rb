Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :places
  resources :posts
  resources :users

  root to: 'places#index', as: 'root'
end
