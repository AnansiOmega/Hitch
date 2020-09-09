Rails.application.routes.draw do
  resources :brokers
  resources :deliveries
  resources :suppliers
  resources :receivers
  resources :drivers

  delete '/sessions/brokers/logout', to: 'sessions#broker_logout', as: 'broker_logout'
  delete '/sessions/drivers/logout', to: 'sessions#driver_logout', as: 'driver_logout'

  get '/sessions/brokers/login', to: 'sessions#broker_login', as: 'broker_login'
  post '/sessions/brokers/logging', to: 'sessions#broker_logging', as: 'broker_logging'

  get '/sessions/drivers/login', to: 'sessions#driver_login', as: 'driver_login'
  post '/sessions/drivers/logging', to: 'sessions#driver_logging', as: 'driver_logging'

  patch '/deliveries/:id/pickup', to: 'deliveries#pickup', as: 'pickup'
  patch '/deliveries/:id/dropoff', to: 'deliveries#dropoff', as: 'dropoff'

  get '/deliveries/:id/transit', to: 'deliveries#transit', as: 'delivery_transit'
  get '/deliveries/:id/dropped_off', to: 'deliveries#dropped_off', as: 'delivery_dropped_off'  


  root to: "sessions#home", as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
