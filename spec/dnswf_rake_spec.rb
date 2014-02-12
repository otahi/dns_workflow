#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe DNSWF::Rake do
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

  describe '#create_rakefile' do
    context 'on the localhost' do
      it 'create Rakefile' do
        DNSWF::Rake.create_rakefile
        Dir.glob('*')
            .should include('Rakefile')
      end
      it 'create Rakefile with config' do
        File.write('dnswf.yml', 'target_zone: example.zone')

        DNSWF::Rake.create_rakefile
        Dir.glob('*')
            .should include('Rakefile')
        File.read('Rakefile')
          .should include('example.zone')
      end
    end
  end
end
