#! /usr/bin/env bash

echo "########################################################################"
echo "### Initiating git                                                   ###"
echo "########################################################################"

read name "What is your name?"
git config --global user.name "$name"
read email "What is your email?"
git config --global user.email "$email" 
read editor "What is your editor?"
sudo git config --system core.editor "$editor"
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=25000"
git config --global push.default simple
