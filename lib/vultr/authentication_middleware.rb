module Vultr
  class AuthenticationMiddleware < Faraday::Middleware
    extend Forwardable
    def_delegators :'Faraday::Utils', :parse_query, :build_query

    def initialize(app, api_key)
      @api_key   = api_key

      super(app)
    end

    def call(env)
      params = { 'api_key' => @api_key }.update query_params(env[:url])

      env[:url].query = build_query params

      @app.call(env)
    end

    def query_params(url)
      if url.query.nil? or url.query.empty?
        {}
      else
        parse_query url.query
      end
    end
  end
end
