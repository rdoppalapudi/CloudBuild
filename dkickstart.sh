#!/bin/bash         
sudo su
yum clean all
yum update
yum -y install java-1.7.0-openjdk.x86_64
mkdir /data
mkdir /data/puppetmodules
chown -R vagrant:vagrant /data/puppetmodules
service iptables stop
chkconfig iptables off
sudo su - vagrant
cp /etc/share/vm/hosts /etc/
jdk_home=$(dirname $(dirname $(readlink -f $(which java))))
export JAVA_HOME=$jdk_home 