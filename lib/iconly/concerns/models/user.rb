module Iconly
  module Concerns
    module Models
      module User
        extend ActiveSupport::Concern

        included do
          has_many :packages
          has_many :projects

          validates :uid, :name, :email, presence: true

          after_create :generate_project
        end

        private

        def generate_project
          return if projects.any?
          projects.create!(name: 'Untitled Project')
        end
      end
    end
  end
end
