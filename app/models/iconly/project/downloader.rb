module Iconly
  class Project
    class Downloader
      DOWNLOADS_FOLDER = Rails.root.join('tmp/downloads').to_s

      def initialize(project)
        @project = project
      end

      def call
        return unless @project.icons.any?
        generate
        zip_file_path
      rescue => e
        Rails.logger.error e
        nil
      end

      private

      def generate
        with_glyphs do |path|
          Project::FontGenerator.new(path, output_path).call
        end
        ZipFileGenerator.new(output_path, zip_file_path).write
      end

      def with_glyphs
        Dir.mktmpdir do |dir|
          FileUtils.cp @project.icons.map(&:svg_path), dir
          yield dir if block_given?
        end
      end

      def output_path
        @output_path ||= Dir.mktmpdir
      end

      def svg_path
        unless @svg_path
          icon      = @project.icons.first
          @svg_path = File.dirname(Rails.root.join("public#{icon.svg.url}"))
        end
        @svg_path
      end

      def zip_file_path
        @zip_file_path ||= File.join(DOWNLOADS_FOLDER, "#{@project.slug}_#{Time.current.to_i}.zip")
      end
    end
  end
end
