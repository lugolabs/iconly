module Iconly
  class Project < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :project_icons
    has_many :icons, through: :project_icons
  end
end
