module Iconly
  class Package < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :icons, dependent: :destroy

    attr_accessor :icon_files, :icon_files_required

    extend FriendlyId
    friendly_id :name, use: [:slugged, :scoped], scope: :user

    validates :name, presence: true, uniqueness: { scope: :user }
    validates :icon_files, presence: true, if: :icon_files_required

    after_save :generate_icons, if: :icon_files_required

    scope :shared, -> { where(shared: true) }
    scope :shared_or_owned_by, ->(user_id) { where(user_id: user_id).or(shared) }

    private

    def generate_icons
      icon_files.each do |file|
        name = file.original_filename.split('.')[0..-2].join('.')
        icons.create!(name: name, svg: file, contents: file.read)
      end
    end

    def should_generate_new_friendly_id?
      name_changed?
    end
  end
end
