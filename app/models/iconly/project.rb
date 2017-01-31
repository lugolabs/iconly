module Iconly
  class Project < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :project_icons
    has_many :icons, through: :project_icons

    extend FriendlyId
    friendly_id :name, use: [:slugged, :scoped], scope: :user
  end
end
