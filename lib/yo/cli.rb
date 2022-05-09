module Yo
  class Cli
    GLOBAL_OPTIONS = [
      ["--help", "-h", GetoptLong::NO_ARGUMENT]
    ].freeze

    COMMAND_OPTIONS = {
      "create" => [
        ["--project", "-p", GetoptLong::REQUIRED_ARGUMENT]
      ],
      "projects" => [],
      "help" => []
    }.freeze

    attr_reader :global_options, :command, :command_options, :arguments

    def initialize
      @global_options = parse_global_options
      @command = parse_command(@global_options)
      @command_options = parse_command_options_and_arguments(command)
      @arguments = ARGV.dup
    end

    private

    def parse_global_options
      getoptlong(GLOBAL_OPTIONS, GetoptLong::REQUIRE_ORDER)
    end

    def parse_command(global_options)
      return "help" if global_options.key?("--help")

      (ARGV.shift || "help").downcase.tap do |result|
        next if COMMAND_OPTIONS.key?(result)
        raise "unknown command: #{result}"
      end
    end

    def parse_command_options_and_arguments(command)
      getoptlong(COMMAND_OPTIONS.fetch(command), GetoptLong::PERMUTE)
    end

    def getoptlong(options, ordering)
      parser = GetoptLong.new(*options)
      parser.ordering = ordering

      {}.tap do |result|
        parser.each { |option, argument| result[option] = argument }
      end
    end
  end
end
