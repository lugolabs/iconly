require 'test_helper'

module Iconly
  class UserTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(iconly_packages), User.reflect_on_all_associations.map(&:name)
    end
  end
end
