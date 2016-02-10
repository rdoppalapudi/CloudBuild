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
sudo yum install puppet-server -y
sudo puppet resource package puppet-server ensure=latest
cp /etc/share/vm/puppet.conf /etc/puppet/
rm -rf /etc/puppet/manifests
ln -s /etc/share/vm/manifests /etc/puppet/manifests
ln -s /etc/share/vm/puppet-hiera-enc /etc/puppet/puppet-hiera-enc
#start 
sudo puppet master --verbose --daemonize --logdest /var/log/puppet/master.log
#install puppet module for tomcat
puppet module install puppetlabs-tomcat
puppet module install puppetlabs-java
puppet module install maestrodev-maven
