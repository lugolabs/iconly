require 'test_helper'

module Iconly
  class Test < ActiveSupport::TestCase
    test 'works' do
      assert_kind_of Module, Iconly
    end

    test 'configuration' do
      assert_equal '/login', Iconly.login_path
      assert_equal '/logout', Iconly.logout_path
    end
  end
end
