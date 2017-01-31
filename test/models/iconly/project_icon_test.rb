require 'test_helper'

module Iconly
  class ProjectIconTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(project icon), ProjectIcon.reflect_on_all_associations.map(&:name)
    end

    # all_projects
    test 'all_projects without search' do
      user     = iconly_users(:fred)
      projects = [iconly_projects(:one), iconly_projects(:two)]

      ProjectIcon.all_projects(user.id).each_with_index do |prj, i|
        assert_equal projects[i], prj[0]
        assert_equal projects[i].project_icons, prj[1]
      end
    end

    test 'all_projects with search' do
      user = iconly_users(:fred)
      project = iconly_projects(:one)

      ProjectIcon.all_projects(user.id, 'twitter').each do |prj|
        assert_equal project, prj[0]
        assert_equal [iconly_project_icons(:two)], prj[1]
      end
    end
  end
end
