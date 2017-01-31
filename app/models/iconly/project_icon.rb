module Iconly
  class ProjectIcon < ApplicationRecord
    belongs_to :project, class_name: 'Project'
    belongs_to :icon, class_name: 'Icon'

    def self.all_projects(user_id, term = nil)
      icons = includes(:icon, :project)
              .joins(:icon, :project)
              .merge(Project.owned_by(user_id))
      icons = icons.merge(Icon.search(term)) if term.present?
      icons
        .order('iconly_projects.name')
        .group_by(&:project)
    end
  end
end
