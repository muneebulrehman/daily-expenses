# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resource :users do
    resource :categories
    resource :items
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :home, only: [:index]
  root "home#index"
end
