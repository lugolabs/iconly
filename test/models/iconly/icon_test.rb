require 'test_helper'

module Iconly
  class IconTest < ActiveSupport::TestCase
    test 'associations' do
      assert_equal %i(package), Icon.reflect_on_all_associations.map(&:name)
    end
  end
end
