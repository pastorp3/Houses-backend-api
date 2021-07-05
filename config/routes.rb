Rails.application.routes.draw do
  resources :favorites
  resources :houses
  resources :users, only: [ :create, :destroy ]
  get "users/login", to: "users#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
