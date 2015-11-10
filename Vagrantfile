# -*- mode: ruby -*-
# vi: set ft=ruby :

provision_script = <<SCRIPT
if [ ! -f ~/.ready_to_create_containers ]; then
  USE_LXC_1_1=0 sh /vagrant/setup_lxc.sh
  touch ~/.ready_to_create_containers
else
  sh /vagrant/create_containers.sh
fi
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.33.104"

  config.vm.synced_folder ".", "/vagrant"

  # vagrant up && vagrant reload --provision
  config.vm.provision "shell", privileged: false, inline: provision_script
end
