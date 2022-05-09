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
          description: params.description || "",
          project_id: project_id
        }
      end

      def project_id
        return params.project_id if params.project_id
        return find_project_id_by_name if project_name
        raise "either project id or project short name should be specified"
      end

      def find_project_id_by_name
        projects = client.projects
        project = projects.find { _1.fetch("shortName") == project_name }
        raise "project with the specified name not found" unless project
        project.fetch("id")
      end

      def project_name
        params.project_name
      end
    end
  end
end
