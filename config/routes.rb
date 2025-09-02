Rails.application.routes.draw do

  get "dashboard/index"

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  
  root "dashboard#index"

  resources :dashboard, only: [:index]
  resources :items
  resources :inventory,  only: [:index]
  resources :orders, only: [:index, :show]
  resources :members
end
