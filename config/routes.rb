Rails.application.routes.draw do
  root 'home#index'

  # Routes for Spotify authentication
  get 'auth/spotify/callback', to: 'user#spotify', as: 'spotify_login'
  get 'auth/failure', to: redirect('/')
  # get 'logout', to: 'sessions#google_auth_logout'
end
