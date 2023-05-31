Rails.application.routes.draw do
  get 'registrations/new'
  get 'registrations/create'
  get 'user_sessions/new'
  get 'user_sessions/create'
  get "/", :controller => "places", :action => "index"
  resources "places"
  resources "posts"
  resources "sessions"
  resources "users"
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create'


end
