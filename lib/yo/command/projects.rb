module Yo
  module Command
    class Projects < Base
      def execute
        projects = client.projects
        rows = [projects.first.keys] + projects.map { _1.values }
        widths = {}

        rows.each do |row|
          row.each_with_index do |value, index|
            widths[index] = [widths[index].to_i, value.length].max
          end
        end

        rows = rows.map do |row|
          values = row.map.with_index do |value, index|
            value.to_s.ljust(widths[index])
          end

          values.join("  ")
        end

        puts rows.join("\n")
      end

      private

      def client
        @client ||= Client.new(
          token: Config.youtrack_api_token,
          root_url: Config.youtrack_root_url
        )
      end
    end
  end
end
