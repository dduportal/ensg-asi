# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "dduportal/boot2docker"

  # PostgreSQL NAT
  config.vm.network :forwarded_port, guest: 5432, host: 5432, auto_correct: true

  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true

end
