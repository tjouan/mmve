lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH << lib unless $LOAD_PATH.include? lib
require 'mmve/version'

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


  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'aruba'
  s.add_development_dependency 'rake'
end
