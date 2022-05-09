module Yo
  class CommandBuilder
    attr_reader :cli, :configuration

    def initialize(cli:, configuration:)
      @cli = cli
      @configuration = configuration
    end

    def command
      command_class.new(
        params: params,
        configuration: configuration
      )
    end

    private

    def command_class
      resolve_sibling("Yo::Command")
    end

    def params_class
      resolve_sibling("Yo::Params")
    rescue
      Params::Blank
    end

    def resolve_sibling(scope)
      ClassResolver.new(scope: scope, class_name: cli.command).resolve
    end

    def params
      params_class.new(
        arguments: cli.arguments,
        options: cli.command_options
      )
    end
  end
end
