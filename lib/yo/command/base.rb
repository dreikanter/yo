module Yo
  module Command
    class Base
      attr_reader :params, :configuration

      def initialize(params:, configuration:)
        @params = params
        @configuration = configuration
      end

      def execute
        raise "not implemented"
      end

      protected

      def system_path(path)
        File.join(repository.path, SYSTEM_DIR, path)
      end

      def write_file(file_name, content)
        FileUtils.mkdir_p(File.dirname(file_name), mode: 0o755)
        File.write(file_name, content)
      end
    end
  end
end
