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
    context('without argument')
    it 'create a new Vagrantfile' do
      DNSWF::Command.start(['init'])
      $stdout.string.should include('creating a new Vagrantfile')
    end
  end

  describe '#prepare' do
    context('without argument')
    it 'run vagrant up' do
      Kernel.stub(:system).and_return(true)

      DNSWF::Command.start(['prepare'])

      $stdout.string.should include('running "vagrant up"')
    end
  end

  describe '#test' do
    context('without argument')
    it 'run local rspec tests' do
      DNSWF::Command.start(['test'])

      $stdout.string.should include('testing DNS')
    end
  end

  describe '#deploy' do
    context('without argument')
    it 'ask if run deploy or not' do
      agree_true = double('agree_true')
      agree_true.stub(:agree).and_return(true)
      HighLine.stub(:new).and_return(agree_true)

      agree_true.should_receive(:agree).with(/Are you sure?/)

      DNSWF::Command.start(['deploy'])
    end
  end

  describe '#update' do
    context('without argument')
    it 'ask if run update or not' do
      agree_true = double('agree_true')
      agree_true.stub(:agree).and_return(true)
      HighLine.stub(:new).and_return(agree_true)

      agree_true.should_receive(:agree).with(/Are you sure?/)

      DNSWF::Command.start(['update'])
    end
  end

  describe '#rollback' do
    context('without argument')
    it 'ask if run rollback or not' do
      agree_true = double('agree_true')
      agree_true.stub(:agree).and_return(true)
      HighLine.stub(:new).and_return(agree_true)

      agree_true.should_receive(:agree).with(/Are you sure?/)

      DNSWF::Command.start(['rollback'])
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
