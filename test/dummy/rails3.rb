require 'action_controller/railtie'

class RailsApplication < Rails::Application
  config.middleware.use Rack::Cookieless

  config.encoding = 'utf-8'
  config.secret_token = '94623f03d94af16a1f13fc347c0aa3d5'
  config.session_store :cookie_store, key: '_dummy_session'
  config.cache_store = :memory_store

  config.cache_classes = true
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=3600"
  config.whiny_nils = true
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.active_support.deprecation = :stderr
end

Rails.application.initialize!

Rails.application.routes.draw do
  get '/' => 'welcome#index'
end

class WelcomeController < ActionController::Base
  def index
    render text: 'ok'
  end
end

