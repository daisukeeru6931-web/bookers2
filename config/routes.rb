Rails.application.routes.draw do
  root to: "homes#top"
  get "home/about", to: "homes#about", as: :about

  resource :session
  resources :passwords, param: :token

  get "users/sign_up", to: "registrations#new", as: :new_user
  post "users", to: "registrations#create"

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check
end