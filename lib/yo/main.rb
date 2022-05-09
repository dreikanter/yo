module Yo
  class Main
    def run
      command.execute
    end

    private

    def command
      CommandBuilder.new(
        cli: cli,
        configuration: configuration
      ).command
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def cli
      @cli ||= Cli.new
    end
  end
end
