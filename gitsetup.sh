#! /usr/bin/env bash

echo "########################################################################"
echo "### Initiating git                                                   ###"
echo "########################################################################"

git init
read "What is your name?" name
git config --global user.name $name
read "What is your email?" email
git config --global user.email $email 
read "What is your editor?" editor
sudo git config --system core.editor $editor
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=25000"
git config --global push.default simple
