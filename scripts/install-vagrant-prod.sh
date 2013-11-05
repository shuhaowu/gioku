#!/bin/bash

if [ -f /home/vagrant/installed ]; then
  echo "Setup already completed.. skipping. To run this again, remove /home/vagrant/installed"
  exit 0
fi
sudo apt-get install -y git
git clone https://github.com/shuhaowu/gioku.git
sudo chown vagrant:vagrant gioku

bash gioku/scripts/install-prod.sh
touch /home/vagrant/installed
