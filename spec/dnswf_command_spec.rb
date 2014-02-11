#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'spec_helper'
require 'highline/import'

describe DNSWF::Command do
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

  describe '#init' do
    context('without argument') do
      it 'create a new Rakefile' do
        DNSWF::Command.start(['init'])
        $stdout.string.should include('creating a new Rakefile')
      end
    end
  end

  describe '#version' do
    it 'show version with name and date' do
      DNSWF::Command.start(['version'])

      $stdout.string.should include('OTA')
      $stdout.string.should include('2014')
    end
  end
end
