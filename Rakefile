require 'cucumber/rake/task'
require 'rspec/core/rake_task'

desc 'Run all scenarios'
Cucumber::Rake::Task.new(:features)

desc 'Run all specs'
RSpec::Core::RakeTask.new(:spec)


task default: [:features, :spec]
