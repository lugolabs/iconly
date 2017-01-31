require 'test_helper'

module Iconly
  class PackageTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(user), Package.reflect_on_all_associations.map(&:name)
    end

    test 'name presence validation' do
      package = Package.new

      assert_not package.valid?
      assert_equal ["Name can't be blank"], package.errors.full_messages
    end
  end
end
