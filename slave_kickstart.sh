#!/bin/bash         
sudo su
yum clean all
yum update
mkdir /data
mkdir /data/puppetmodules
chown -R vagrant:vagrant /data/puppetmodules
service iptables stop
chkconfig iptables off
sudo su - vagrant
cp /etc/share/vm/hosts /etc/
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
sudo yum install puppet -y
puppet agent --server cloudbuild-master-1.cloud.net -t --debug