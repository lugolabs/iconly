require 'test_helper'

module Iconly
  class PackageTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(iconly_user), Package.reflect_on_all_associations.map(&:name)
    end
  end
end
