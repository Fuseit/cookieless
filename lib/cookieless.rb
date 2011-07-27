require 'digest/sha1'

module Rack
  class Cookieless
    def initialize(app, options={})
      @app, @options = app, options
    end

    def cache_store
      options[:cache_store] || Rails.cache
    end

    def session_key
      (options[:session_id] || :session_id).to_s
    end

    def call(env)
      if support_cookie?(env)
        @app.call(env)
      else
        session_id = Rack::Utils.parse_query(env["QUERY_STRING"], "&")[session_key] || env["session_id"]
        cache_id = Digest::SHA1.hexdigest session_id

        env["rack.session"] = cache_store.fetch(cache_id) { env["rack.session"] }

        status, header, body = @app.call(env)

        body = process_body(body, session_id)
        cache_store.write(cache_id, env["rack.session"])

        [status, header, body]
      end
    end

    def process_body(body, session_id)
      ###
    end

    def support_cookie?(env)
      false
    end
  end
end
