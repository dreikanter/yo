module Yo
  class Configuration
    attr_reader :pwd, :data

    def initialize(data = {})
      @pwd = Dir.pwd
      @data = data
    end

    def repository_path
      File.expand_path(data.fetch("repository_path", "."), pwd)
    end

    def debug?
      data["debug"] == true
    end

    def quiet?
      data["quiet"] == true
    end

    def editor
      data.fetch("editor") { ENV.fetch("EDITOR") }
    end

    def daemonize?
      data.fetch("daemonize", true)
    end

    private

    def configuration_path
      data["configuration_path"]
    end
  end
end
