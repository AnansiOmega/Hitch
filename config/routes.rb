Rails.application.routes.draw do
  resources :brokers
  resources :deliveries
  resources :suppliers
  resources :receivers
  resources :drivers
  root to: "sessions#home", as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
