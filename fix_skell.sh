#! /usr/bin/env bash
set -e

echo "#########################################################################"
echo "### Running skell command                                             ###"
echo "#########################################################################"

skell

echo "#########################################################################"
echo "### Retrieving config files from git                                  ###"
echo "#########################################################################"

cd ~/Documents/Linuxstuff/
git reset --hard

read

echo "#########################################################################"
echo "### Recreating soft links for configs                                 ###"
echo "#########################################################################"

ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.bashrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.vimrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.zshrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/alacritty.yml ~/.config/alacritty/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/neofetch.config.conf\
	       	~/.config/neofetch/config.conf
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/variety.conf ~/.config/variety/

echo "#########################################################################"
echo "### Done! Now will reboot system                                      ###"
echo "#########################################################################"

reboot
