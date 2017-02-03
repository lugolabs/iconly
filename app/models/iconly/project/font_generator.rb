module Iconly
  class Project
    class FontGenerator
      include FileUtils::Verbose

      FONT_NAME = 'iconly'.freeze

      def initialize(vectors_path, output_path, font_name = nil)
        @vectors_path = vectors_path
        @output_path  = output_path
        @font_name    = font_name || FONT_NAME
      end

      def call
        input = {
          vectors:   @vectors_path,
          templates: templates_path
        }

        raw_options = {
          debug:        Rails.env.development?,
          input:        input,
          templates:    %w(iconly.css),
          font_name:    @font_name,
          css_selector: ".#{@font_name}-{{glyph}}",
          no_hash:      true,
          verbose:      true,
          manifest:     manifest_path,
          output:       {
            fonts: output_fonts_path,
            css:   @output_path
          }
        }

        run_generators raw_options
      end

      private

      def run_generators(raw_options)
        options  = Fontcustom::Options.new(raw_options).options
        manifest = Fontcustom::Manifest.new(manifest_path, options)

        Fontcustom::Generator::Font.new(manifest.manifest).generate
        Fontcustom::Generator::Template.new(manifest.manifest).generate
      end

      def output_fonts_path
        File.join(@output_path, 'fonts')
      end

      def manifest_path
        File.join(config_folder, 'fontcustom_manifest.yml')
      end

      def templates_path
        File.join(config_folder, 'templates')
      end

      def config_folder
        File.expand_path('../../../../../config/fontcustom', __FILE__)
      end
    end
  end
end
