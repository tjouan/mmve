require File.expand_path('../lib/mmve/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mmve'
  s.version     = MMVE::VERSION
  s.summary     = 'Mass MV Editor'
  s.description = 'Mass MV Editor: move files with your text editor'
  s.license     = 'BSD-3-Clause'
  s.homepage    = 'https://rubygems.org/gems/mmve'

  s.authors     = 'Thibault Jouan'
  s.email       = 'tj@a13.fr'

  s.files       = `git ls-files lib`.split $/
  s.executables = 'mmve'
  s.extra_rdoc_files = %w[README.md]

  s.add_dependency 'baf', '~> 0.11'

  s.add_development_dependency 'baf-testing', '~> 0'
  s.add_development_dependency 'rake',        '>= 10.4'
  s.add_development_dependency 'rspec',       '~> 3.2'
end
