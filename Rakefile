require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new

spec_task_name = :spec
RSpec::Core::RakeTask.new(spec_task_name)

desc 'Run everything'
task build: [:rubocop, spec_task_name]
