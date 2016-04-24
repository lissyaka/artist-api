Rails.application.routes.draw do
  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'
  get '/artists/:id/albums', to: 'albums#index'
  get '/albums/:id', to: 'albums#show'
  get '*unmatched_route', to: 'application#not_found'
end
