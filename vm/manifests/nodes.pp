node default { 

	    class { 'tomcat': }
class { 'java': }
tomcat::instance { 'test':
  source_url => 'http://mirror.nexcess.net/apache/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz'
}->
tomcat::service { 'default': }


}
node cloudbuild-slave-1 {
	
	    class { 'tomcat': }
class { 'java': }
tomcat::instance { 'test':
  source_url => 'http://mirror.nexcess.net/apache/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz'
}->
tomcat::service { 'default': }

}