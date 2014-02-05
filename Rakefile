#!/usr/bin/env rake

require 'rake'
require 'rspec/core/rake_task'

task :default => :travis
task :travis => [:spec]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end
