module Yo
  module Command
    class Help < Base
      HELP = <<~TEXT
        yo - YouTrack little helper

        Usage: yo [COMMON_OPTIONS] [COMMAND] [COMMAND_OPTIONS]

        Commands:

          create - generate new note and open it in the editor
          version - display version number
          help - show commands list or usage details for a specific command

        Common options:

          --help - similar to the help command
          --path - repository directory path; default is current directory
      TEXT

      def execute
        puts HELP
      end
    end
  end
end
