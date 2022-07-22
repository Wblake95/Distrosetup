#! /usr/bin/env bash

echo "########################################################################"
echo "### Initiating git                                                   ###"
echo "########################################################################"

git config --global user.name "Wesley Blake"
git config --global user.email "wesleyblake95@gmail.com"
sudo git config --system core.editor "vim" # Doesn't seem to work
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=25000"
git config --global push.default simple
