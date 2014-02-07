require_relative '../dnswf'

module DNSWF
  # Represents Vagrant, which can be operable.
  class Vagrant
    def self.create_vagrantfile
      puts 'creating a new Vagrantfile'
      FileUtils.touch('Vagrantfile')
    end

    def self.run
      puts 'running "vagrant up"'
      Kernel.system('vagrant up')
    end
  end
end
