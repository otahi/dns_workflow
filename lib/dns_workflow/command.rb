require 'thor'
require_relative '../dnswf'

module DNSWF
  # Thor to operate commands.
  class Command < Thor
    desc 'init', 'Initiate a project'
    def init
      DNSWF::Vagrant.create_vagrantfile
    end

    desc 'prepare', 'Prepare an test environment'
    def prepare
      DNSWF::Vagrant.run
    end

    desc 'test', 'Test DNS servers'
    def test
      DNSWF::Dns.new.test
    end

    desc 'deploy', 'Deploy DNS server settings with backup'
    def deploy
      DNSWF::Dns.new.deploy
    end

    desc 'update', 'Update DNS settings'
    def update
      DNSWF::Dns.new.update
    end

    desc 'rollback', 'Deploy DNS server settings'
    def rollback
      DNSWF::Dns.new.rollback
    end

    desc 'version', 'Show version'
    def version
      puts "dns_workflow #{DNSWF::VERSION}"
      puts "(c) #{DNSWF::YEARCOPYRIGHT} OTA Hiroshi"
    end
    map '-v' => :version
  end
end
