# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'bundler'
require File.expand_path('../config/application', __FILE__)
require 'rake'

begin
  require 'metric_fu'
  MetricFu::Configuration.run do |config|
     config.rcov[:rcov_opts] << "-Itest"
  end
rescue LoadError
end

task :cruise do
  `bundle install`
end


Scheduler::Application.load_tasks
