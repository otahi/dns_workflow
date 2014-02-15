# -*- coding: utf-8 -*-
require 'yaml'

module DNSWF
  # Represents configuration
  class Config
    @target_zone = 'example.zone'
    @target_zone_files = 'example.zone, example.rev'
    @target_conf_files = 'named.conf'

    attr_reader :target_zone
    attr_reader :target_zone_files
    attr_reader :target_conf_files

    # TODO: DI is needed
    def initialize(args = {})
      config = read_config(args)
      config.each do |k, v|
        instance_variable_set("@#{k}", v)
      end if config
    end

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
