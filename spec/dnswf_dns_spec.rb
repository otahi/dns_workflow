#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'spec_helper'
require 'highline/import'

describe DNSWF::Dns do
  before(:all) do
    @original_dir = Dir.pwd
  end

  before(:each) do
    $stdout, $stderr = StringIO.new, StringIO.new
    FileUtils.mkdir_p('spec_temp')
    FileUtils.cd('spec_temp')
  end

  after(:each) do
    $stdout, $stderr = STDOUT, STDERR
    FileUtils.cd(@original_dir)
    FileUtils.rm_rf(['spec_temp'])
  end

  describe '#test' do
  end

  describe '#deploy' do
    context('a user agrees yes to do') do
      before(:each) do
        agree_true = double('agree_true')
        agree_true.stub(:agree).and_return(true)
        HighLine.stub(:new).and_return(agree_true)
      end

      context('on the local server') do
        let(:dns) do
          DNSWF::Dns.new
        end
        let(:namedconf) do
          'etc/named.conf'
        end
        let(:zone) do
          'var/named/masters/example.zone'
        end
        let(:rev) do
          'var/named/masters/example.rev'
        end

        it 'backup original files with dated directory' do
          FileUtils.mkdir_p('etc')
          FileUtils.touch(namedconf)
          FileUtils.mkdir_p('var/named/masters')
          FileUtils.touch(zone)
          FileUtils.touch(rev)

          dns.deploy

          Dir.entries('backups')
            .should have_at_least(1).include(/#{Date.today}/)
          Dir.glob("backups/**/#{namedconf}")
            .should have_at_least(1).include(/#{Date.today}/)
          Dir.glob("backups/**/#{zone}")
            .should have_at_least(1).include(/#{Date.today}/)
          Dir.glob("backups/**/#{rev}")
            .should have_at_least(1).include(/#{Date.today}/)
        end
      end
    end
  end

  describe '#update' do
  end

  describe '#rollback' do
  end
end
