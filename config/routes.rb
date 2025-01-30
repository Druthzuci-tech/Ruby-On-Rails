# config/routes.rb
Rails.application.routes.draw do
  # Define the root path route ("/")
  root "pages#home"  # This should point to the home page controller

  resources :users
end
