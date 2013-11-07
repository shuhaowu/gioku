#!/bin/bash

if [ -f /home/vagrant/installed ]; then
echo "Setup already completed.. skipping. To run this again, remove /home/vagrant/installed"
  exit 0
fi

bash /vagrant/scripts/basesetup.sh
sudo su git -c "/home/git/bin/gitolite setup -pk /vagrant/adminkey.pub"

sudo ln -s /vagrant/src/hooks/post-receive /home/git/.gitolite/hooks/common/post-receive
sudo su git -c "mkdir -p /home/git/gioku/elevated"
sudo su git -c "mkdir -p /home/git/nginxconfs/certs; chmod 700 -R /home/git/nginxconfs"
sudo su git -c "mkdir /home/git/www; chmod 755 /home/git/www"
sudo sh -c "echo 'include /home/git/nginxconfs/*.conf;' > /etc/nginx/conf.d/gioku.conf"
sudo ln -s /vagrant/DOMAIN /home/git/gioku/DOMAIN
sudo ln -s /vagrant/src/elevated/handle_certs /home/git/gioku/elevated/handle_certs
sudo chmod 755 /home/git/gioku/elevated/handle_certs
sudo su git -c "/home/git/bin/gitolite setup -ho"

touch /home/vagrant/installed
