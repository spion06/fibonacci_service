require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "net/http"
require "uri"
require "json"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :docker do

  desc 'build docker container'
  task :build do
    puts %x(docker build -t fibonacci_service #{File.dirname(__FILE__)})
  end

  desc 'test service in docker container'
  task :test do
    puts 'Running unit tests'
    Rake::Task["spec"].invoke

    puts 'Building docker container'
    Rake::Task["docker:build"].invoke

    puts 'Starting docker container'
    output = %x[docker run -d -p 8080:8080 fibonacci_service;echo $?].split("\n")
    raise "Error starting docker container: #{output.join("\n")}" if output.last.strip != "0"
    sleep 10
    begin
      response = Net::HTTP.get_response(URI.parse('http://localhost:8080/fibonacci/10')).body
      json_response = JSON.parse(response)
      raise "Invalid response #{response}" if json_response['value'] != [0,1,1,2,3,5,8,13,21,34]
      puts 'All tests successful'
    ensure 
      %x[ docker kill #{output[0].strip} ] 
    end
  end
end

