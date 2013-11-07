#!/bin/bash

sudo mkdir -p /home/git/gioku/elevated
sudo rm -f /home/git/.gitolite/hooks/common/post-receive
sudo cp $(dirname $0)/../src/hooks/post-receive /home/git/.gitolite/hooks/common/post-receive
sudo cp $(dirname $0)/../src/elevated/handle_certs /home/git/gioku/elevated/handle_certs
sudo chown git:git /home/git/.gitolite/hooks/common/post-receive
sudo chown root:root -R /home/git/gioku/elevated
sudo chmod 755 /home/git/gioku/elevated/handle_certs
sudo su git -c "/home/git/bin/gitolite setup -ho"
