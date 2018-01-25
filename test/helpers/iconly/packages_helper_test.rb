require 'test_helper'

module Iconly
  class PackagesHelperTest < ActionView::TestCase
    include PackagesHelper
    include SessionsHelper

    test 'my_package check user' do
      package = iconly_packages(:jupiter)
      @request.session[:user_id] = package.user.id

      assert my_package?(package)
    end
  end
end
