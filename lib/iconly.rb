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

module Iconly
  mattr_accessor :logout_path
  mattr_accessor :login_path
end
