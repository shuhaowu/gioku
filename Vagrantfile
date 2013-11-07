# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define "dev", primary: true do |dev|
    dev.vm.synced_folder ".", "/vagrant", :nfs => true
    dev.vm.provision :shell, :path => "scripts/install-vagrant.sh"
    dev.vm.network :private_network, ip: "192.168.33.177"
  end

  config.vm.define "prod" do |prod|
    prod.vm.provision :shell, :path => "scripts/install-vagrant-prod.sh"
    prod.vm.network :private_network, ip: "192.168.33.178"
  end

end
