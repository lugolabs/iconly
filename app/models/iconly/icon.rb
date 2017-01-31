module Iconly
  class Icon < ApplicationRecord
    belongs_to :package, class_name: 'Package'

    extend FriendlyId
    friendly_id :name, use: [:slugged, :scoped], scope: :package

    validates :name, presence: true

    scope :search, ->(term) { where('icons.name ILIKE ?', "%#{term}%") }
  end
end
