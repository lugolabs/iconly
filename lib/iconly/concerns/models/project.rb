module Iconly
  module Concerns
    module Models
      module Project
        extend ActiveSupport::Concern

        included do
          belongs_to :user, class_name: 'User'
          has_many :project_icons
          has_many :icons, through: :project_icons

          extend FriendlyId
          friendly_id :name, use: %i[slugged scoped], scope: :user

          scope :owned_by, ->(owner_id) { where('iconly_projects.user_id' => owner_id) }
          scope :without_icons, -> { where.not(id: ProjectIcon.select(:project_id)) }
        end

        private

        def should_generate_new_friendly_id?
          name_changed?
        end
      end
    end
  end
end
