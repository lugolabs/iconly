module Iconly
  class Package < ApplicationRecord
    belongs_to :user, class_name: 'User'

    extend FriendlyId
    friendly_id :name, use: [:slugged, :scoped], scope: :user

    validates :name, presence: true, uniqueness: { scope: :user }

    scope :shared, -> { where(shared: true) }
    scope :shared_or_owned_by, ->(user_id) { where(user_id: user_id).or(shared) }
  end
end
