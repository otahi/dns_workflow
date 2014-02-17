# -*- coding: utf-8 -*-
require_relative '../dnswf'
require 'highline/import'

module DNSWF
  # Represent "a DNS server", which is testable and
  # operable.
  class Dns
    def test
      puts 'testing DNS'
    end

    def deploy
      hl = HighLine.new($stdin, $stdout)
      execute = hl.agree('deploy files. Are you sure?')
      if execute
        puts 'backing up original DNS files'
        backup_files
        puts 'deploying new DNS files'
        puts 'verifing new DNS files'
      end
    end

    def update
      hl = HighLine.new($stdin, $stdout)
      execute = hl.agree('update DNS settings. Are you sure?')
      if execute
        puts 'updating DNS settings'
        puts 'refleshing DNS settings'
        test
      end
    end

    def rollback
      hl = HighLine.new($stdin, $stdout)
      execute = hl.agree('rolling back to DNS settings. Are you sure?')
      if execute
        puts 'rolling back to original DNS settings'
        puts 'refleshing DNS settings'
        test
      end
    end

    def initialize
    end

    def backup_files
      time_str = Time.now.strftime('%Y-%m-%d-%H-%M-%S')

      backup_dir = "backups/servername-#{time_str}"
      FileUtils.mkdir_p(backup_dir)
      %w(etc/named.conf
         var/named/masters/example.zone
         var/named/masters/example.rev).each do |src|
        target_dir = "#{backup_dir}/#{File.dirname(src)}"
        FileUtils.mkdir_p(target_dir)
        FileUtils.cp(src, target_dir)
      end
    end
    protected:backup_files
  end
end
