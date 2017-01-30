$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'iconly/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'iconly'
  s.version     = Iconly::VERSION
  s.authors     = ['Artan Sinani']
  s.email       = ['artisinani@gmail.com']
  s.homepage    = 'https://github.com/lugolabs/iconly'
  s.summary     = 'Store SVG and generate your web font icons'
  s.description = 'Store SVG and generate your web font icons with Iconly.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rubocop'
end
