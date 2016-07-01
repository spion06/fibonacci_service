require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :docker do

  task :build do
    puts %x(docker build -t fibonacci_service #{File.dirname(__FILE__)})
  end

end

