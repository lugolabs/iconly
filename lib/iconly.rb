require 'friendly_id'
require 'carrierwave'
require 'fontcustom'
require 'sass-rails'
require 'jquery-rails'
require 'turbolinks'
require 'bootstrap'
require 'rails-assets-tether'
require 'iconly/engine'
require 'iconly/zip_file_generator'
require 'iconly/concerns/models/project'
require 'iconly/concerns/models/user'

module Iconly
  GITHUB_URL = 'https://github.com/lugolabs/iconly'.freeze

  mattr_accessor  :logout_path,
                  :login_path,
                  :svg_folder,
                  :downloads_folder
end
