require 'test_helper'

module Iconly
  class UserTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(packages projects), User.reflect_on_all_associations.map(&:name)
    end

    test 'validations' do
      user = User.new

      assert_not user.valid?
      assert_equal ["Uid can't be blank", "Name can't be blank", "Email can't be blank"], user.errors.full_messages
    end

    test 'should generate a project on create' do
      user = User.create(uid: '11', name: 'Paul', email: 'paul@example.com')

      assert_equal 1, user.projects.size
      assert_equal 'Untitled Project', user.projects.first.name

      user.destroy
    end
  end
end
