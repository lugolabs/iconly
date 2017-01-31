require 'test_helper'

module Iconly
  class ProjectsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @project = iconly_projects(:one)
      ApplicationController.any_instance.stubs(:current_user).returns(@project.user)
    end

    test 'should get index' do
      get projects_url

      assert_response :success
      assert_select 'h1', 'Projects'
    end

    test 'should get new' do
      get new_project_url

      assert_response :success
      assert_select 'h1', 'New Project'
    end

    test 'should create project' do
      assert_difference('@project.user.projects.count') do
        post projects_url, params: { project: { name: 'New project' } }
      end

      assert_redirected_to project_url(Project.friendly.find('new-project'))
    end

    test 'should show project' do
      get project_url(@project)

      assert_response :success
    end

    # test 'should get edit' do
    #   get edit_project_url(@project)
    #   assert_response :success
    # end

    # test 'should update project' do
    #   patch project_url(@project), params: {
    #     project: { name: @project.name, slug: @project.slug, user_id: @project.user_id }
    #   }
    #   assert_redirected_to project_url(@project)
    # end

    # test 'should destroy project' do
    #   assert_difference('Project.count', -1) do
    #     delete project_url(@project)
    #   end

    #   assert_redirected_to projects_url
    # end
  end
end