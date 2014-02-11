# -*- coding: utf-8 -*-
require 'thor'
require_relative '../dnswf'

module DNSWF
  # Thor to operate commands.
  class Command < Thor
    desc 'init', 'Initiate a project'
    def init
      DNSWF::Rake.create_rakefile
    end

    desc 'version', 'Show version'
    def version
      puts "dns_workflow #{DNSWF::VERSION}"
      puts "(c) #{DNSWF::YEARCOPYRIGHT} OTA Hiroshi"
    end
    map '-v' => :version
  end
end
