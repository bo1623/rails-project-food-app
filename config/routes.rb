Rails.application.routes.draw do
  resources :corporations
  resources :locations
  resources :restaurants
  resources :meals
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
