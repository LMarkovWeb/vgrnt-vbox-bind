# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 1
  end

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
  SHELL
  
  # # NS1 server BIND
  # config.vm.define "named-ns1" do |ns1|
  #   ns1.vm.box = 'generic/centos8'
  #   ns1.vm.hostname = 'ns1.loc'
  #   ns1.vm.network "private_network", ip: "192.168.20.221"
  #   ns1.vm.provision "shell", path: "scripts/install-centos.sh"
  # end

  # # NS2 server BIND
  # config.vm.define "named-ns2" do |ns2|
  #   ns2.vm.box = 'generic/centos8'
  #   ns2.vm.hostname = 'ns2.loc'
  #   ns2.vm.network "private_network", ip: "192.168.20.222"
  # end

  # NS3 server BIND - Ubuntu 20
  config.vm.define "named-ns3" do |ns3|
    ns3.vm.box = 'peru/ubuntu-20.04-server-amd64'
    ns3.vm.hostname = 'ns3.loc'
    ns3.vm.network "private_network", ip: "192.168.20.223"
    ns3.vm.provision "shell", path: "scripts/install-ubuntu.sh"
    ns3.vm.network "forwarded_port", id: "named-ns3", guest: 10000, host: 10000, guest_ip: "10.0.2.15", host_ip: "127.0.0.1", protocol: "tcp"
  end
  
  # host
  config.vm.define "host1" do |host1|
    host1.vm.box = "generic/ubuntu1804"
    host1.vm.hostname = 'host1.loc'
    host1.vm.network "private_network", ip: "192.168.20.10"
  end

end