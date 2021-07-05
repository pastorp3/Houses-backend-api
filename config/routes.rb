Rails.application.routes.draw do
  resources :favorites , only: [ :show, :create, :destroy]
  get "favorites/user/:id", to: "favorites#index"
  resources :houses
  resources :users, only: [ :create, :destroy ]
  get "users/login", to: "users#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
