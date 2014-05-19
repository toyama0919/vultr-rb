module Vultr
  module Resource
    class Plan < Base
      def list
        @connection.get('/v1/plans/list').body
      end
    end
  end
end
