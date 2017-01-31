require 'test_helper'

module Iconly
  class ProjectIconTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(project icon), ProjectIcon.reflect_on_all_associations.map(&:name)
    end
  end
end
