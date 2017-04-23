require File.expand_path('../lib/mmve/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mmve'
  s.version     = MMVE::VERSION
  s.summary     = "mmve-#{MMVE::VERSION}"
  s.description = 'Mass MV Editor: move files with your favourite $EDITOR'
  s.license     = 'BSD-3-Clause'
  s.homepage    = 'https://rubygems.org/gems/mmve'

  s.authors     = 'Thibault Jouan'
  s.email       = 'tj@a13.fr'

  s.files       = `git ls-files`.split $/
  s.executables = 'mmve'
  s.extra_rdoc_files = %w[README.md]

  s.add_dependency 'baf', '~> 0.10'

  s.add_development_dependency 'baf-testing'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec',     '~> 3.2'
end
