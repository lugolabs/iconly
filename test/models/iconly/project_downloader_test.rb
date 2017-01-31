require 'test_helper'

module Iconly
  class ProjectDownloaderTest < ActiveSupport::TestCase
    test 'downloads a zip file with fonts' do
      project = iconly_projects(:one)
      project.icons.each do |icon|
        icon.update(svg: File.open(File.join(fixture_path, "iconly/files/#{icon.to_param}.svg")))
      end

      zip_file = Project::Downloader.new(iconly_projects(:one)).call

      assert zip_file.include?("test/dummy/tmp/downloads/#{project.to_param}")
      assert zip_file.ends_with?('.zip')
    end
  end
end
