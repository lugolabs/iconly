require 'test_helper'

module Iconly
  class ZipFileGeneratorTest < ActiveSupport::TestCase
    test 'generate zip file from folder' do
      Dir.mktmpdir do |path|
        Dir.mktmpdir do |input_dir|
          output_file = File.join(path, 'test.zip')
          ZipFileGenerator.new(input_dir, output_file).write

          assert File.exist?(output_file)
        end
      end
    end
  end
end
