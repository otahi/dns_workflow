#!/usr/bin/env rake

require 'rake'

task :default => :travis
task :travis => [:spec, :rubocop, 'coveralls:push']

require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

Rubocop::RakeTask.new(:rubocop) do |task|
  task.patterns = %w(bin/*
                     lib/**/*.rb
                     spec/**/*.rb
                     Rakefile
                     Gemfile)
end
