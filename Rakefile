require 'cucumber/rake/task'
require 'rspec/core/rake_task'


task default: %i[features spec]

Cucumber::Rake::Task.new :features do |t|
  t.profile = 'quiet' if ENV.key? 'TRAVIS'
end

RSpec::Core::RakeTask.new
