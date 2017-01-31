module Iconly
  module PackagesHelper
    def my_package?(package)
      current_user && package.user == current_user
    end

    def link_to_share(package)
      classes = %w(text-sm mr-1)
      classes << 'shared' if package.shared?
      link_to share_package_path(package), class: classes.join(' '), data: { action: 'share-package' } do
        content_tag :i, '', class: 'sybina-0801-share2'
      end
    end

    def icon_svg(icon, project_icons = nil)
      css_class = %w(btn btn-svg float-left)
      css_class << 'selected' if project_icons && project_icons.include?(icon.id)
      data = {
        id:     icon.id,
        action: 'add-to-project'
      }
      content_tag :div, icon.contents.html_safe, class: css_class.join(' '), data: data, title: icon.name
    end
  end
end
