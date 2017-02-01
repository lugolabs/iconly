require 'test_helper'

module Iconly
  class Test < ActiveSupport::TestCase
    test 'works' do
      assert_kind_of Module, Iconly
    end

    test 'configuration' do
      assert_equal '/login', Iconly.login_path
      assert_equal '/logout', Iconly.logout_path
      assert_equal 'test/dummy/public', Iconly.svg_folder
      assert_equal Rails.root.join('tmp/downloads').to_s, Iconly.downloads_folder
    end
  end
end
