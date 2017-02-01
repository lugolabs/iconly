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
      get project_url(id: @project)

      assert_response :success
    end

    test 'should get edit' do
      get edit_project_url(@project)
      assert_response :success
    end

    test 'should update project' do
      patch project_url(@project), params: {
        project: { name: 'New name' }
      }
      assert_redirected_to project_url(@project)
    end

    test 'should destroy project' do
      assert_difference('Iconly::Project.count', -1) do
        delete project_url(@project)
      end

      assert_redirected_to projects_url
    end

    test 'should generate font' do
      downloader = stub(call: fixture_file_upload('iconly/files/facebook.svg'))
      Project::Downloader.expects(:new).with(@project).returns(downloader)

      post generate_font_project_url(@project)

      assert_response :success
      assert response.body.include?('</svg>')
    end
  end
end
