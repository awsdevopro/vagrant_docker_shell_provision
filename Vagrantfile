VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false
  config.vm.define "brodi-devbox" do |devbox|
    devbox.vm.hostname = "brodi-devbox"
    devbox.vm.network "public_network", bridge: "wlp1s0"
  end
  config.vm.synced_folder "./", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.name = "brodi-devbox"
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
  config.vm.provision :shell, path: "./box-provision.sh"
  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", run: "always"
end
