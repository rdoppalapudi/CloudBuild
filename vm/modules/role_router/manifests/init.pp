# == Class: role_router
#
# Full description of class role_router here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'role_router':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class role_router {

  file { '/var/log/router-log':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

class { 'tomcat': }
class { 'java': }

tomcat::instance { 'test':
  source_url => 'http://mirror.nexcess.net/apache/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz'
}->
tomcat::service { 'default': }


}
