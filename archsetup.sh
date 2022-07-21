#! /usr/bin/env bash

echo "#########################################################################"
echo "### Hello! This is my script that will set up my desktop.             ###"
echo "### I don't have to do it anymore!                                    ###"
echo "#########################################################################"

echo "#########################################################################"
echo "### collecting keyrings                                               ###"
echo "#########################################################################"
sudo pacman -Sy archlinux-keyring arcolinux-keyring

echo "#########################################################################"
echo "### updating system and installing packages                           ###"
echo "### pacman flatpak pip                                                ###"
echo "#########################################################################"
sudo pacman -Syyu
sudo pacman -S --needed --noconfirm vim emacs ranger vifm\
	gimp krita discord steam flatpak python-pip

sudo flatpak update
sudo flatpak install com.heroicgameslauncher.hgl

pip update

echo "#########################################################################"
echo "### Installing ProtonGE                                               ###"
echo "#########################################################################"
pip install protonup
protonup

echo "#########################################################################"
echo "### Setting up Steamdeck UI                                           ###"
echo "#########################################################################"
cd ~/.steam/steam/package
echo "steampal_stable_9a24a2bf68596b860cb6710d9ea307a76c29a04d" > beta

echo "#########################################################################"
echo "### Running hblock and skell                                          ###"
echo "#########################################################################"
hblock
skell

echo "#########################################################################"
echo "### Setting up git and adding my repositories                         ###"
echo "#########################################################################"
bash gitsetup.sh
cd ~/Documents
git clone https://github.com/Wblake95/Linuxstuff
git clone https://github.com/Wblake95/Python_Learning

echo "#########################################################################"
echo "### Setting pointers for config files to appropriate locations        ###"
echo "#########################################################################"
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.bashrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.vimrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.zshrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/alacritty.yml ~/.config/alacritty/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/neofetch.config.conf\
       	~/.config/neofetch/config.conf
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/variety.conf ~/.config/variety/

echo "#########################################################################"
echo "### Done!                                                           #####"
echo "#########################################################################"
