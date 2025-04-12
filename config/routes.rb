Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/ratings', to: 'users#ratings'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/ratings', to: 'ratings#index'
  post '/ratings', to: 'ratings#create'
  get '/ratings/:id', to: 'ratings#show'
  patch '/ratings', to: 'ratings#update'
  delete '/ratings/:id', to: 'ratings#destroy'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
  get '/movies/:id/genres', to: 'movies#genres'
  get '/movies/genres/:id', to: 'movies#genresFind'
  get '/movies/:id/ratings', to: 'movies#ratings'

  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'
  get '/games/:id/ratings', to: 'games#ratings'
  post '/games', to: 'games#create'

  get '/recommendations', to: 'recommendations#index'
  post '/recommendations', to: 'recommendations#create'
  get '/recommendations/:id', to: 'recommendations#show'
  patch '/recommendations/:id', to: 'users#update'
  delete '/recommendations/:id', to: 'users#destroy'
end
