Rails.application.routes.draw do

  root "users#new"
  resources :users, only: [:new, :create, :index]

  # this is the api route
  namespace :api do
    resources :users, only: [:create]  
  end


end
