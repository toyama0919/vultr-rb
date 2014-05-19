module Vultr
  module Resource
    class Server < Base

      def list(opts = {})
        @connection.get '/v1/server/list' do |query|
          apply_params(query, opts)
        end.body
      end

      # Needs DCID, VPSPLANID, OSID
      def create(params)
        @connection.get '/v1/server/create' do |query|
          apply_params(query, params)
        end.body
      end

      # Needs SUBID
      def reboot(id)
        @connection.put("/v1/server/reboot").body
      end

      # Needs SUBID
      def halt(id)
        @connection.put("/v1/server/halt").body
      end

      # Needs SUBID
      def start(id)
        @connection.put("/v1/server/start").body
      end

      # Needs SUBID
      def destroy(id, params = {})
        @connection.post("/v1/server/destroy") do |query|
          apply_params(query, params)
        end.body
      end
    end
  end
end
