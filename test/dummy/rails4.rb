require 'action_controller/railtie'

class RailsApplication < Rails::Application
  config.middleware.use Rack::Cookieless

  config.secret_key_base = '94623f03d94af16a1f13fc347c0aa3d5'
  config.session_store :cookie_store, key: '_dummy_session'
  config.assets.enabled = false

  config.cache_classes = true
  config.eager_load = false
  config.serve_static_assets  = true
  config.static_cache_control = "public, max-age=3600"
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.active_support.deprecation = :stderr
end

Rails.application.initialize!

Rails.application.routes.draw do
  root 'welcome#index'
end

class WelcomeController < ActionController::Base
  def index
    render text: 'ok'
  end
end
