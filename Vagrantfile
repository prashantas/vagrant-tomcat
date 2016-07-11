# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "centos-6.6", autostart: false do |v|
    v.vm.box = "puppetlabs/centos-6.6-64-puppet"
    v.vm.hostname = "centos-6-6"
	v.vm.box_version = "1.0.1"

    v.vm.provision "shell", path: "bootstrap.sh"	
  end

  config.vm.define "centos-7.0", autostart: false do |v|
    v.vm.box = "puppetlabs/centos-7.0-64-puppet"
    v.vm.hostname = "centos-7-0"
	v.vm.box_version = "1.0.1"
    v.vm.provision "shell", path: "bootstrap.sh"	
  end

  config.vm.define "ubuntu-12.04", autostart: false do |v|
    v.vm.box = "puppetlabs/ubuntu-12.04-64-puppet"
    v.vm.hostname = "ubuntu-12-04"
	v.vm.box_version = "1.0.1"
    v.vm.provision "shell", path: "bootstrap.sh"	
  end

  config.vm.define "ubuntu-14.04", autostart: false do |v|
    v.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    v.vm.hostname = "ubuntu-14.04"
	v.vm.box_version = "1.0.1"
    v.vm.provision "shell", path: "bootstrap.sh"	
  end

  #
  # Add the required puppet modules before provisioning is run by puppet
  #
  config.vm.provision :shell do |shell|
     shell.inline = "puppet module install puppetlabs-stdlib;
                     puppet module install puppetlabs-concat;
		     puppet module install puppet-archive;
                     puppet module install puppetlabs-java;
                     puppet module install boundary-boundary;
                     exit 0"
  end

  #
  # Use Puppet to provision the server
  # on a single box
  #
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
    puppet.facter = {
      "boundary_api_token" => ENV["BOUNDARY_API_TOKEN"],
      "java_version" => ENV["JAVA_VERSION"] ||= "7"
      #"tomcat_version" => ENV["TOMCAT_VERSION"]
    }
  end


end
