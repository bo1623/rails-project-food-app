# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Notes
- We want to create namespaced routes for only admins to access for the purposes of adding or editing locations and cuisines:

get '/admin/cuisines/new', to: 'cuisines#new'
get '/admin/cuisines/create', to: 'cuisines#create'
get '/admin/locations/new', to: 'locations#new'
get '/admin/locations/new', to: 'locations#new'

scope '/admin', module: 'admin' do
  resources :cuisines, only: [:new,:create,:update,:edit]
  resources :locations, only: [:new,:create,:update,:edit]
end

This is equal to

namespace :admin do
  resources :cuisines, only: [:new,:create,:update,:edit]
  resources :locations, only: [:new,:create,:update,:edit]
end
