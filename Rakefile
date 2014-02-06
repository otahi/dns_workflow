#!/usr/bin/env rake

require 'rake'

task :default => :travis
task :travis => [:spec, :rubocop]

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

require 'rubocop/rake_task'
Rubocop::RakeTask.new(:rubocop) do |task|
  task.patterns = %w(bin/*
                       lib/**/*.rb
                       spec/**/*.rb
                       Rakefile
                       Gemfile)
end
