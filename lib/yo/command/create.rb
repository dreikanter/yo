module Yo
  module Command
    class Create < Base
      def execute
        response = client.create_issue(**create_issue_params)
        puts client.issue_url(response["idReadable"])
      end

      private

      def create_issue_params
        {
          summary: params.summary,
          description: params.description,
          project_id: params.project_id
        }.compact
      end
    end
  end
end
