require "bundler/gem_tasks"
require 'rubocop/rake_task'

task :default => :spec

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
end

task :rspec do
  sh "bundle exec rspec -f RspecKeyValue::Formatter"
end

task :rspec_lint do
  sh "rspec-lint spec/"
end
