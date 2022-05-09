module Yo
  class Config
    def self.debug?
      ENV.key?("DEBUG")
    end

    def self.youtrack_root_url
      ENV.fetch("YOUTRACK_ROOT_URL")
    end

    def self.youtrack_api_token
      ENV.fetch("YOUTRACK_API_TOKEN")
    end
  end
end
