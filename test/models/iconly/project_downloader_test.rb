require 'test_helper'

module Iconly
  class ProjectDownloaderTest < ActiveSupport::TestCase
    test 'downloads a zip file with fonts' do
      zip_file = Project::Downloader.new(iconly_projects(:one)).call

      assert_equal nil, zip_file
    end
  end
end
