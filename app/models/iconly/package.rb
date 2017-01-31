module Iconly
  class Package < ApplicationRecord
    belongs_to :user, class_name: 'User'

    extend FriendlyId
    friendly_id :name, use: [:slugged, :scoped], scope: :user

    validates :name, presence: true, uniqueness: { scope: :user }
  end
end
