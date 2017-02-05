module Iconly
  module Concerns
    module Models
      class Project
        extend ActiveSupport::Concern

        included do
          belongs_to :user, class_name: 'User'
          has_many :project_icons
          has_many :icons, through: :project_icons
        end

        extend FriendlyId
        friendly_id :name, use: [:slugged, :scoped], scope: :user

        scope :owned_by, ->(owner_id) { where('iconly_projects.user_id' => owner_id) }
        scope :without_icons, -> { where.not(id: ProjectIcon.select(:project_id)) }

        private

        def should_generate_new_friendly_id?
          name_changed?
        end
      end
    end
  end
end
