Rails.application.routes.draw do
  get 'home/index'
  # Spree routes

  # sidekiq web UI
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == Rails.application.secrets.sidekiq_username &&
      password == Rails.application.secrets.sidekiq_password
  end
  mount Sidekiq::Web, at: '/sidekiq'

  root to: 'home#index'
  mount Spree::Core::Engine, at: '/'
end