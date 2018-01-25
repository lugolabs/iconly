require 'test_helper'

module Iconly
  class UserTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i[packages projects], User.reflect_on_all_associations.map(&:name)
    end

    test 'should generate a project on create' do
      user = User.create

      assert_equal 1, user.projects.size
      assert_equal 'Untitled Project', user.projects.first.name

      user.destroy
    end
  end
end
