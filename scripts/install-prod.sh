#!/bin/bash

SCRIPT_DIR=$(dirname $0)

bash $SCRIPT_DIR/basesetup.sh
echo "We now need your public key. Please note that this key will have access to gitolite-admin"
read -p "Full path to public key: " keypath

if [ ! -f $keypath ]; then
  echo "Key does not exist! Exitting..."
  exit 1
fi

sudo su git -c "/home/git/bin/gitolite setup -pk $keypath"

bash $SCRIPT_DIR/update-prod.sh
sudo su git -c "mkdir /home/git/gioku"
sudo su git -c "mkdir /home/git/nginxconfs; chmod 700 /home/git/nginxconfs"
sudo su git -c "mkdir /home/git/www; chmod 755 /home/git/www"
sudo sh -c "echo 'include /home/git/nginxconfs/*.conf;' > /etc/nginx/conf.d/gioku.conf"

echo
echo "I need your domain name. Subdomains for this will be used to serve sites. Example: testing.yourdomain.com will serve the repository testing"
read -p "Domain name: " DOMAIN
sudo su git -c "echo $DOMAIN > /home/git/gioku/DOMAIN"
