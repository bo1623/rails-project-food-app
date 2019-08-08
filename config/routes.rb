Rails.application.routes.draw do
  resources :cuisines, only: [:index,:show]
  resources :dishes
  root 'welcome#home'
  resources :locations, only: [:index,:show]
  resources :restaurants
  resources :meals
  resources :users
  resources :meals_dishes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  namespace :admin do
    resources :cuisines, only: [:new,:create,:update,:edit]
    resources :locations, only: [:new,:create,:update,:edit]
  end

end
