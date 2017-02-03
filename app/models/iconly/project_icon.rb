module Iconly
  class ProjectIcon < ApplicationRecord
    belongs_to :project, class_name: 'Project'
    belongs_to :icon, class_name: 'Icon'

    def self.all_projects(user_id, term = nil)
      user_projects = Project.owned_by(user_id)
      icons = includes(:icon, :project)
              .joins(:icon, :project)
              .merge(user_projects)
      icons = icons.merge(Icon.search(term)) if term.present?
      project_icons = icons
                      .order('iconly_projects.name')
                      .group_by(&:project)

      if term.blank?
        projects_without_icons = user_projects.without_icons
        projects_without_icons.each { |p| project_icons[p] = [] }
      end
      project_icons
    end
  end
end
