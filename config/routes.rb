Rails.application.routes.draw do
  root 'welcome#home'
  resources :corporations
  resources :locations
  resources :restaurants
  resources :meals
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
