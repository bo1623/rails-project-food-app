Rails.application.routes.draw do
  resources :cuisines do
    resources :restaurants, only: [:show, :index]
  end
  resources :dishes
  root 'welcome#home'
  resources :locations do
    resources :restaurants, only: [:show, :index]
  end
  resources :restaurants
  resources :meals
  resources :users
  resources :meals_dishes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
