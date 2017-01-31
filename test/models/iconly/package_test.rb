require 'test_helper'

module Iconly
  class PackageTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(user icons), Package.reflect_on_all_associations.map(&:name)
    end

    test 'name presence validation' do
      package = Package.new

      assert_not package.valid?
      assert_equal ["Name can't be blank"], package.errors.full_messages
    end

    test 'validates icon files when required' do
      package = Package.new(name: 'Saturn', icon_files_required: true)
      assert_not package.valid?
      assert_equal ["Icon files can't be blank"], package.errors.full_messages
    end

    test 'shared checks for shared flag' do
      assert_equal [iconly_packages(:jupiter)], Package.shared
    end

    test 'shared_or_owned_by checks for shared and user' do
      assert_equal [iconly_packages(:jupiter), iconly_packages(:mars)],
                   Package.shared_or_owned_by(iconly_users(:fred).id)
    end

    test 'should generate icons when required' do
      package = iconly_packages(:jupiter)
      package.icon_files = [mock(original_filename: 'heart.svg', read: '<svg></svg>')]
      package.icon_files_required = true

      package.save!

      assert_equal 3, package.icons.count
      icon = package.icons.find_by(name: 'heart')
      assert_equal '<svg></svg>', icon.contents
    end
  end
end
