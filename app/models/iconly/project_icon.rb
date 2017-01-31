module Iconly
  class ProjectIcon < ApplicationRecord
    belongs_to :project, class_name: 'Project'
    belongs_to :icon, class_name: 'Icon'
  end
end
