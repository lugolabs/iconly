require 'test_helper'

module Iconly
  class ProjectTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(user project_icons icons), Project.reflect_on_all_associations.map(&:name)
    end
  end
end
