# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.synced_folder ".", "/vagrant", :nfs => true
  config.vm.network :private_network, ip: "192.168.33.177"
  config.vm.provision :shell, :path => "scripts/install-vagrant.sh"
end
