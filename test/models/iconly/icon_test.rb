require 'test_helper'

module Iconly
  class IconTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(package project_icons), Icon.reflect_on_all_associations.map(&:name)
    end

    test 'SVG uploader' do
      icon = Icon.new(
        name: 'Google Plus',
        svg: File.open(File.join(fixture_path, 'iconly/files/googleplus.svg'))
      )
      assert icon.svg.url.ends_with?('googleplus.svg')
    end

    # all_packages
    test 'all_packages without search' do
      user     = iconly_users(:fred)
      packages = [iconly_packages(:jupiter), iconly_packages(:mars)]

      Icon.all_packages(user.id).each_with_index do |pkg_icons, i|
        assert_equal packages[i], pkg_icons[0]
        assert_equal packages[i].icons, pkg_icons[1]
      end
    end

    test 'all_packages with search' do
      user    = iconly_users(:fred)
      package = iconly_packages(:jupiter)

      Icon.all_packages(user.id, 'face').each do |pkg, icons|
        assert_equal package, pkg
        assert_equal [iconly_icons(:facebook)], icons
      end
    end
  end
end
