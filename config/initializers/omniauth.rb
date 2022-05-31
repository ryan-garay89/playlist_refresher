# frozen_string_literal: true
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_ID'],
           ENV['SPOTIFY_CLIENT_SECRET'], scope: %w[
             playlist-modify-public
             playlist-modify-private
             playlist-read-private
             user-read-recently-played
             user-top-read
             user-read-email
           ].join(' ')
end
OmniAuth.config.allowed_request_methods = %i[post]
OmniAuth.config.on_failure = UserController.action(:oauth_failure)
