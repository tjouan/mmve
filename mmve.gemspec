require File.expand_path('../lib/mmve/version', __FILE__)

Gem::Specification.new do |s|
  s.name    = 'mmve'
  s.version = MMVE::VERSION
  s.summary = "mmve-#{MMVE::VERSION}"
  s.description = 'Mass MV Editor: move files with your favourite $EDITOR'
  s.homepage = 'https://rubygems.org/gems/mmve'

  s.authors = 'Thibault Jouan'
  s.email   = 'tj@a13.fr'

  s.files       = `git ls-files`.split $/
  s.test_files  = s.files.grep /\A(spec|features)\//
  s.executables = s.files.grep(/\Abin\//) { |f| File.basename(f) }


  s.add_development_dependency 'rake',      '~> 10.4'
  s.add_development_dependency 'rspec',     '~> 3.2'
  s.add_development_dependency 'cucumber',  '~> 1.3'
  s.add_development_dependency 'aruba',     '~> 0.6'
end
