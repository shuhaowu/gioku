#!/bin/bash

if [ -f /home/vagrant/installed ]; then
echo "Setup already completed.. skipping. To run this again, remove /home/vagrant/installed"
  exit 0
fi

bash /vagrant/scripts/basesetup.sh
sudo su git -c "/home/git/bin/gitolite setup -pk /vagrant/adminkey.pub"

sudo ln -s /vagrant/src/hooks/post-receive /home/git/.gitolite/hooks/common/post-receive
sudo su git -c "mkdir /home/git/gioku"
sudo su git -c "mkdir /home/git/nginxconfs; chmod 700 /home/git/nginxconfs"
sudo su git -c "mkdir /home/git/www; chmod 755 /home/git/www"
sudo sh -c "echo 'include /home/git/nginxconfs/*.conf;' > /etc/nginx/conf.d/gioku.conf"
sudo ln -s /vagrant/DOMAIN /home/git/gioku/DOMAIN
sudo su git -c "/home/git/bin/gitolite setup -ho"

touch /home/vagrant/installed
