#!/bin/sh

set -e

git config --global user.email $GIT_USER_EMAIL
git config --global user.name $GIT_USER_NAME
git clone $REPO repo
cd repo

# backup rancher environment
rancher export -s --file - | tar -xvf -
git add --all
git commit -m "Update Environment Config"
git push origin master
cd .. && rm -rf repo