Rails.application.routes.draw do
  resources :brokers
  resources :deliveries
  resources :suppliers
  resources :receivers
  resources :drivers
  delete '/sessions/brokers/logout', to: 'sessions#broker_logout', as: 'broker_logout'
  get '/sessions/brokers/login', to: 'sessions#broker_login', as: 'broker_login'
  post '/sessions/brokers/logging', to: 'sessions#broker_logging', as: 'broker_logging'

  

  root to: "sessions#home", as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
