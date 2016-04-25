Rails.application.routes.draw do
  resources :artists, only: [:index, :show]
  resources :albums, only: [:index]
  get '*unmatched_route', to: 'application#not_found'
end
