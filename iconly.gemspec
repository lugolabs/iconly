$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'iconly/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'iconly'
  s.version     = Iconly::VERSION
  s.authors     = ['Artan Sinani']
  s.email       = %w(artisinani@gmail.com)
  s.homepage    = 'https://github.com/lugolabs/iconly'
  s.summary     = 'Store SVG and generate your web font icons'
  s.description = 'Store SVG and generate your web font icons with Iconly.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.1'

  s.add_dependency 'coffee-rails', '~> 4.2'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'turbolinks', '~> 5'
  s.add_dependency 'uglifier', '>= 1.3.0'

  # Bootstrap
  s.add_dependency 'bootstrap', '~> 4.0.0.alpha6'
  s.add_dependency 'rails-assets-tether', '>= 1.1.0'#, source: 'https://rails-assets.org'

  # Database
  s.add_dependency 'pg', '~> 0.18'

  # Slugging
  s.add_dependency 'friendly_id', '~> 5.0.0'

  # Fonts
  s.add_dependency 'fontcustom', '~> 1.3.8'
  s.add_dependency 'listen', '< 3.0'

  # Upload
  s.add_dependency 'carrierwave', '~> 1.0'

  # Zipping
  s.add_dependency 'rubyzip', '~> 1.2.1'

  # Development group

  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rubocop', '~> 0.49.0'

  # Use Puma as the app server
  s.add_development_dependency 'puma', '~> 3.0'
end
