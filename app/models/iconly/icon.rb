module Iconly
  class Icon < ApplicationRecord
    belongs_to :package, class_name: 'Package'
    has_many :project_icons, dependent: :destroy

    mount_uploader :svg, SvgUploader

    extend FriendlyId
    friendly_id :name, use: %i[slugged scoped], scope: :package

    validates :name, :contents, presence: true

    scope :search, ->(term) { where('iconly_icons.name ILIKE ?', "%#{term}%") }

    def self.all_packages(user_id, term = nil)
      with_package = user_id ? Package.shared_or_owned_by(user_id) : Package.shared
      icons = includes(:package)
              .joins(:package)
              .merge(with_package)
      icons = icons.merge(search(term)) if term.present?
      icons
        .order('iconly_packages.name')
        .group_by(&:package)
    end

    def svg_path
      File.join(Iconly.svg_folder, svg.try(:url) || '')
    end

    def markup
      (contents || '').gsub(']>', '').html_safe
    end

    def human_name
      name.humanize(capitalize: false)
    end

    private

    def should_generate_new_friendly_id?
      name_changed?
    end
  end
end
