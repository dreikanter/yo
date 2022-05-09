module Yo
  module Params
    class Create < Base
      def project
        options.fetch("--project")
      end
    end
  end
end
