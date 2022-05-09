module Yo
  module Params
    class Create < Base
      def project_name
        options["--project-short-name"]
      end

      def project_id
        options["--project"]
      end

      def summary
        options.fetch("--summary").strip.tap do |value|
          raise "non-empty issue summary should be specified" if value.empty?
        end
      end

      def description
        options["--description"].to_s.strip
      end
    end
  end
end
