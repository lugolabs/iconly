module Iconly
  class User < ApplicationRecord
    has_many :packages
    has_many :projects

    validates :uid, :name, :email, presence: true

    after_create :generate_project

    private

    def generate_project
      return if projects.any?
      projects.create(name: 'Untitled Project')
    end
  end
end
