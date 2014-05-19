module Vultr
  module Resource
    class Region < Base
      # @return [Hashie::Rash] List of all regions
      # @example
      #   regions = client.regions.list
      def list
        @connection.get('/v1/regions/list').body
      end
      
      def availability(dcid)
        @connection.get('/v1/regions/availability').body
      end
    end
  end
end
