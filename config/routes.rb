Rails.application.routes.draw do
  resources :cuisines
  resources :dishes
  root 'welcome#home'
  resources :locations
  resources :restaurants
  resources :meals
  resources :users
  resources :meals_dishes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
