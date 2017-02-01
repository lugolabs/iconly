require 'test_helper'

module Iconly
  class PackagesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      ApplicationController.any_instance.stubs(:current_user).returns(iconly_users(:fred))
      @package = iconly_packages(:jupiter)
    end

    test 'should get new' do
      get new_package_url

      assert_response :success
      assert_select 'title', 'Add Icons : Iconly'
    end

    test 'should create package' do
      file = fixture_file_upload('iconly/files/facebook.svg')
      assert_difference('Iconly::Package.count') do
        post packages_url, params: {
          package: {
            name:       'Saturn',
            icon_files: [file]
          }
        }
      end

      assert_redirected_to projects_url
    end

    test 'should destroy package' do
      assert_difference('Iconly::Package.count', -1) do
        delete package_url(@package)
      end

      assert_redirected_to projects_url
    end
  end
end
