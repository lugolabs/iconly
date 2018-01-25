module Iconly
  module PackagesHelper
    def my_package?(package)
      current_user && package.user == current_user
    end

    def link_to_share(package)
      classes = %w[iconly-earth text-sm mr-1]
      classes << 'shared' if package.shared?
      link_to(share_package_path(package),
              class: classes.join(' '),
              title: 'Make public',
              data: { action: 'share-package', toggle: 'iconly-tooltip' }) do
        content_tag :span, '', class: 'text-pale'
      end
    end

    def icon_svg(icon, project_icons = nil)
      css_class = %w[btn btn-svg float-left]
      css_class << 'selected' if project_icons && project_icons.include?(icon.id)
      data = {
        id:     icon.id,
        action: 'add-to-project',
        toggle: 'iconly-tooltip'
      }
      content_tag :div, icon.markup, class: css_class.join(' '), data: data, title: icon.human_name
    end
  end
end
