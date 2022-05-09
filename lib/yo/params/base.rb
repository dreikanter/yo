module Yo
  module Params
    class Base
      attr_reader :arguments, :options

      def initialize(arguments: [], options: {})
        @arguments = arguments
        @options = options
      end
    end
  end
end
