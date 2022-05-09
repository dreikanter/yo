module Yo
  class Cache
    attr_reader :path

    def initialize(path:)
      @path = path
    end

    def fetch(key)
      file_name = cache_path(key)

      if File.exist?(file_name)
        return JSON.parse(File.read(file_name))
      end

      FileUtils.mkdir_p(File.dirname(file_name))
      yield.tap { File.write(file_name, JSON.pretty_generate(_1)) }
    end

    private

    def cache_path(key)
      File.join(path, "#{key}.json")
    end
  end
end
