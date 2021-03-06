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
  
  $key1= hiera("key1") 

  file { '/etc/abc.xml':
    content => template('role_router/abc.xml.erb'),
    owner   => root,
    group   => root,
    mode    => 644,
  }

  file { '/var/log/router-log':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

class { 'tomcat': }

class { 'java':
  distribution          => "jdk",
  package               =>  "java-1.8.0-openjdk-devel",
  version               =>  "installed"
 }

tomcat::instance { 'test':
  source_url => 'http://supergsego.com/apache/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.tar.gz'
}->
tomcat::service { 'default': }



class {'nexus':
    url      => "https://oss.sonatype.org/",
}


nexus::artifact {'spring-example':
    gav        => "com.cloudseal.client:spring-example:1.2.7",
    repository => "public"
,    packaging => 'war',
    output     => "/tmp/spring-example-1.2.7.war",
    ensure     => present
}->
tomcat::war { 'spring-example.war':
  catalina_base => '/opt/apache-tomcat/',
  war_source => '/tmp/spring-example-1.2.7.war',
}

class { "maven::maven":
    version => "3.2.5", # version to install
    # you can get Maven tarball from a Maven repository instead than from Apache servers, optionally with a user/password
   
  }-> 
 maven { "/tmp/web-1.0.0-20151129.055956-1.war":
  groupid    => "com.example",
  artifactid => "web",
  version    => "1.0.0-SNAPSHOT",
  packaging => "war",
  repos => "https://s3.amazonaws.com/cloudack/snapshot"
 

}


}

class custom_env{
  
}
