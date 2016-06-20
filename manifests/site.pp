# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

node /^ubuntu/ {

  exec { 'update-apt-packages':
    command => '/usr/bin/apt-get update -y',
	timeout     => 1800,
  }


  class { 'boundary':
    token => $boundary_api_token,
    require => Exec['update-apt-packages']
  }

}

# Separate the Cento 7.0 install until the boundary meter puppet package is fixed
node /^centos-7-0/ {

 exec { 'update-rpm-packages':
    command => '/usr/bin/yum update',
	timeout     => 1800,
  }

  class { 'boundary':
    token => $boundary_api_token,
	require => Exec['update-rpm-packages']
    
  }
}

node /^centos/ {
  
  exec { 'update-rpm-packages':
    command => '/usr/bin/yum update -y',
	timeout     => 1800,
  }

  class { 'boundary':
    token => $boundary_api_token,
    require => Exec['update-rpm-packages']
  }
}

#### Added by Prashanta for memcached

class { 'tomcat':
 }


#class memcached {
#  package { 'memcached':
#      ensure => 'latest'
#        }


#  service { 'memcached':
#	      ensure => running,
#	          enable => true,
#		      require => Package['memcached'],
# }

#}
