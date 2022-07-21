#! /usr/bin/env bash

git config --global user.name "Wesley Blake"
git config --global user.email "wesleyblake95@gmail.com"
sudo pacman -S vim --needed
sudo git config --system core.editor vim
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=25000"
git config --global push.default simple
