# -*- coding: utf-8 -*-
require 'yaml'

module DNSWF
  # Represents configuration
  class Config
    @target_zone = 'example.zone'

    def initialize(args = {})
      config = read_config(args)
      @target_zone =
        config['target_zone'] if config && config['target_zone']
    end

    attr_reader :target_zone

    def read_config(args = {})
      if args[:yaml] && File.exist?(args[:yaml])
        YAML.load(File.read(args[:yaml]))
      end
    end

    def this_binding
      binding
    end
  end
end
