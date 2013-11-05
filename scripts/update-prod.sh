#!/bin/bash

sudo rm -f /home/git/.gitolite/hooks/common/post-receive
sudo cp $(dirname $0)/../src/hooks/post-receive /home/git/.gitolite/hooks/common/post-receive
sudo chown git:git /home/git/.gitolite/hooks/common/post-receive
sudo su git -c "/home/git/bin/gitolite setup -ho"
