Rails.application.routes.draw do
  resources :deliveries
  resources :suppliers
  resources :brokers
  resources :receivers
  resources :drivers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
