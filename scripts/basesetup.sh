#!/bin/bash

LATEST_GITOLITE_VERSION=v3.5.3.1

sudo apt-get update
sudo apt-get install -y nginx git vim 

# Nginx Setup
sudo sed -i 's/# server_names_hash_bucket_size/server_names_hash_bucket_size/' /etc/nginx/nginx.conf

# from dokku
if ! grep -q gioku-nginx-reload "/etc/sudoers"; then
touch /etc/sudoers.tmp
  cp /etc/sudoers /tmp/sudoers.new
  echo "%git ALL=(ALL)NOPASSWD:/etc/init.d/nginx reload # gioku-nginx-reload" >> /tmp/sudoers.new
  EDITOR="cp /tmp/sudoers.new" visudo
  rm /tmp/sudoers.new
fi

sudo /etc/init.d/nginx start

# Gitolite setup
sudo adduser --disabled-password -gecos "" git
sudo -u git git clone https://github.com/sitaramc/gitolite.git /home/git/gitolite
cd /home/git/gitolite
sudo su git -c "git checkout $LATEST_GITOLITE_VERSION"
sudo -u git mkdir /home/git/bin
sudo su git -c "echo "export PATH=\$PATH:/home/git/bin" >> /home/git/.bashrc"
sudo su git -c "/home/git/gitolite/install -ln"

