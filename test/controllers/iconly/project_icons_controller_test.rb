require 'test_helper'

module Iconly
  class ProjectIconsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @project = iconly_projects(:one)
      ApplicationController.any_instance.stubs(:current_user).returns(@project.user)
    end

    test 'should create a new project icon' do
      icon = iconly_icons(:check)
      post project_icons_url, params: { project_id: @project.to_param, icon_id: icon.id }

      assert_response :success
      assert response.body.blank?
    end

    test 'destroy existing project icon' do
      icon = iconly_project_icons(:one).icon
      delete project_icon_url(icon.id), params: { project_id: @project.to_param }

      assert_response :success
      assert response.body.blank?
    end
  end
end
