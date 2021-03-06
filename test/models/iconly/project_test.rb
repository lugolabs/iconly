require 'test_helper'

module Iconly
  class ProjectTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i[user project_icons icons], Project.reflect_on_all_associations.map(&:name)
    end

    test 'owned_by returns projects by user' do
      fred_projects = %i[one two three].map { |id| iconly_projects(id) }
      assert_equal fred_projects, Project.owned_by(iconly_users(:fred))
    end

    test 'without_icons returns projects without icons' do
      projects_without_icons = %i[three fourth].map { |id| iconly_projects(id) }
      assert_equal projects_without_icons, Project.without_icons
    end

    test 'friendly id' do
      project = Project.friendly.find('second-project')

      assert_equal 'second-project', project.slug
      assert_equal 'Second Project', project.name
    end
  end
end
