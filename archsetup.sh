#! /usr/bin/env bash

echo "Hello! This is my script that will set up my desktop so I don't have to do it anymore!"
sudo pacman -Sy archlinux-keying arcolinux-keyring
sudo pacman -Syyu
sudo pacman -S --needed --noconfirm vim emacs ranger vifm gimp krita discord steam flatpak python-pip

sudo flatpak update
sudo flatpak install com.heroicgameslauncher.hgl

pip update
pip install protonup

protonup
hblock

skell

cd ~/Documents
git clone https://github.com/Wblake95/Linuxstuff
git clone https://github.com/Wblake95/Python_Learning

ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.bashrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.vimrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.zshrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/alacritty.yml ~/.config/alacritty/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/neofetch.config.conf ~/.config/neofetch/config.conf
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/variety.conf ~/.config/neofetch/

echo "#################"
echo "#### Done! ######"
echo "#################"
