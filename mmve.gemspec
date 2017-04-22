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


  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec',     '~> 3.2'
  s.add_development_dependency 'cucumber',  '~> 1.3'
  s.add_development_dependency 'aruba',     '~> 0.6'
end
