Rails.application.routes.draw do

  get "dashboard/index"

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  
  root "dashboard#index"

  resources :dashboard, only: [:index]
  resources :items
  resources :inventory
  resources :orders
  resources :members
end
