# -*- mode: ruby -*-
# vi: set ft=ruby :
hostarr=["cloudbuild-master-1.cloud.net","cloudbuild-slave-1.cloud.net","cloudbuild-slave-2.cloud.net","cloudbuild-slave-3.cloud.net"]
iparr=["192.168.33.11","192.168.33.12","192.168.33.13","192.168.33.14"]
rolearr=["master","slave","slave","slave"]
Vagrant.configure("2") do |config|
 (0..3).each do |i|
  config.vm.define "node#{i}" do |agent|
    config.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", 1024]
     end
     agent.vm.hostname = hostarr[i]
     agent.vm.box = "centos"
     agent.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"
     agent.vm.network :private_network, ip: iparr[i]
     agent.vm.synced_folder "vm", "/etc/share/vm"
     agent.vm.provision :shell, :path => rolearr[i]+"_kickstart.sh"

  end
end
end


