module Yo
  module Params
    class Create < Base
      def project_id
        options.fetch("--project")
      end

      def summary
        options.fetch("--summary")
      end

      def description
        options["--description"]
      end
    end
  end
end
