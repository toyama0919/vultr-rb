module Vultr
  module Resource
    class OS < Base
      def list(opts = {})
        @connection.get('/v1/os/list', opts).body
      end
    end
  end
end
