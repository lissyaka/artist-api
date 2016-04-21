Rails.application.routes.draw do
get '/artists', to: 'artists#index'
get '/artists/:id/albums', to: 'artists#show_albums'

end
