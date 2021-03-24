# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-18.04"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provider "virtualbox" do |v|
    if ENV['VAGRANT_MB_MEMORY']
      v.memory = ENV['VAGRANT_MB_MEMORY']
    end
    if ENV['VAGRANT_CPUS']
      v.cpus = ENV['VAGRANT_CPUS']
    end
  end

  config.vm.synced_folder ".", "/home/vagrant/perl-ectoken"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y build-essential cpanminus
    /home/vagrant/perl-ectoken/deps.sh
  SHELL
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    #do the environment variable dance
    tee -a /home/vagrant/.bashrc <<'EOF'
export CDPATH="/home/vagrant/perl-ectoken"
export PERL5LIB="/home/vagrant/perl-ectoken/lib/perl"
EOF

    cd /home/vagrant/perl-ectoken
    #make all

  SHELL

end
