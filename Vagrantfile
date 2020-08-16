# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y docker.io curl ethtool tcpdump
    
    if [ ! -e /usr/local/bin/docker-compose ]; then
      curl -s -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      chmod +x /usr/local/bin/docker-compose
    fi

    sudo usermod -aG docker vagrant || true
    sudo systemctl restart docker
  SHELL

  config.vm.provision "shell", inline: <<-SHELL
    cd /vagrant
    docker-compose build
  SHELL

  config.vm.hostname = "blog-lab-mtu"

end
