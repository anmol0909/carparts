Rails.application.routes.draw do

  get "dashboard/index"

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  
  root "dashboard#index"

  resources :dashboard, only: [:index] do
    collection do
      get :counts
    end
  end

  resources :orders, only: [:index]
  resources :members, only: [:index]
end
