# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	# Every Vagrant virtual environment requires a box to build off of.
	config.vm.box = "chenhan/ubuntu-desktop-18.10"
	# config.vm.box_url = "chenhan/ubuntu-desktop-18.10"
	config.vm.box_version = "20181019.0.0"

	# Assign this VM to a host-only network IP, allowing you to access it
	# via the IP. Host-only networks can talk to the host machine as well as
	# any other machines on the same network, but cannot be accessed (through this
	# network interface) by any external networks.
	config.vm.network :private_network, ip: "192.168.10.10"
	config.vm.hostname = "vagrant-dev"
	# config.vm.hostname = "vagrant-dev"
	# config.vm.network :public_network

	# config.vm.synced_folder "./srv", "/srv", nfs: true
	config.vm.synced_folder "./data", "/data", nfs: true

	config.vm.provider :virtualbox do |virtualbox|
		virtualbox.gui = true
		virtualbox.customize ["modifyvm", :id, "--name", "vagrant-dev"]
		virtualbox.customize ["modifyvm", :id, "--memory", "4096", "--cpus", "4", "--vram", "256"]
		virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
	end

	config.vm.provision "shell" do |s|
		# s.path = "provisioning/initial-setup-empty.sh"
		s.path = "provisioning/initial-setup.sh"
		s.args = "/vagrant/provisioning"
	end


end
