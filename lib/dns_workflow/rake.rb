# -*- coding: utf-8 -*-
require 'erb'

module DNSWF
  # Represents rake
  class Rake
    def self.create_rakefile
      puts 'creating a new Rakefile'
      erb_result =
        ERB.new(File.read('../template/Rakefile.erb')).result(binding)
      File.open('./Rakefile', 'w') do |f|
        f.write(erb_result)
      end
    end
  end
end
