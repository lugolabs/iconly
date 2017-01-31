module Iconly
  class Icon < ApplicationRecord
    SVG_FOLDER = 'test/dummy/public'.freeze

    belongs_to :package, class_name: 'Package'

    mount_uploader :svg, SvgUploader

    extend FriendlyId
    friendly_id :name, use: [:slugged, :scoped], scope: :package

    validates :name, presence: true

    scope :search, ->(term) { where('iconly_icons.name ILIKE ?', "%#{term}%") }

    def self.all_packages(user_id, term = nil)
      with_package = user_id ? Package.shared_or_owned_by(user_id) : Package.shared
      icons = Icon
              .includes(:package)
              .joins(:package)
              .merge(with_package)
      icons = icons.merge(search(term)) if term.present?
      icons
        .order('iconly_packages.name')
        .group_by(&:package)
    end

    def svg_path
      "#{SVG_FOLDER}#{svg.url}"
    end
  end
end
