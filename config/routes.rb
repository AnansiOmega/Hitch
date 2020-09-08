Rails.application.routes.draw do
  resources :deliveries
  resources :suppliers
  resources :brokers
  resources :receivers
  resources :drivers
  
end
