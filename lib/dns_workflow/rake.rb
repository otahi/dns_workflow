# -*- coding: utf-8 -*-
require 'erb'
require_relative 'config'

module DNSWF
  # Represents rake
  class Rake
    DEFAULT_DNSWF_YAML = 'dnswf.yml'

    def self.create_rakefile
      config = Config.new(:yaml => DEFAULT_DNSWF_YAML)
      puts 'creating a new Rakefile'
      erb_result =
        ERB.new(File.read('../template/Rakefile.erb')
                ).result(config.this_binding)
      File.open('./Rakefile', 'w') do |f|
        f.write(erb_result)
      end
    end
  end
end
