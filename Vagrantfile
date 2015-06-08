# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/debian-7.8"
  config.vm.network :private_network, ip: "192.168.33.177"
  config.vm.synced_folder ".", "/vagrant", nfs: true
end

