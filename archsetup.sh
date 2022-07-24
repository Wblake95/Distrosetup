#! /usr/bin/env bash
set -e
echo "########################################################################"
echo "### Hello! This is my script that will set up my desktop.            ###"
echo "### I don't have to do it anymore!                                   ###"
echo "########################################################################"

echo "########################################################################"
echo "### collecting keyrings                                              ###"
echo "########################################################################"
sudo pacman -Sy --needed --noconfirm archlinux-keyring arcolinux-keyring

echo "########################################################################"
echo "### updating system and installing packages                          ###"
echo "### skell command for ArcoLinux                                      ###"
echo "### pacman flatpak pip                                               ###"
echo "########################################################################"
sudo pacman -Syyu
sudo pacman -S --needed --noconfirm vim emacs ranger vifm
sudo pacman -S --needed --noconfirm gimp krita
sudo pacman -S --needed --noconfirm discord steam nvidia
sudo pacman -S --needed --noconfirm flatpak python-pip 

sudo flatpak update
sudo flatpak install com.heroicgameslauncher.hgl\
	com.valvesoftware.Steam.CompatibilityTool.Proton-GE

pip update

skell

echo "########################################################################"
echo "### Setting up Steamdeck UI                                          ###"
echo "########################################################################"
cd ~/.local/share/Steam/package/
echo "steampal_stable_9a24a2bf68596b860cb6710d9ea307a76c29a04d" > beta

echo "########################################################################"
echo "### Running hblock                                                   ###"
echo "########################################################################"
hblock

echo "########################################################################"
echo "### Setting up git and adding my repositories                        ###"
echo "########################################################################"
bash ~/Documents/Distrosetup/gitsetup.sh
cd ~/Documents
git clone https://github.com/Wblake95/Linuxstuff
git clone https://github.com/Wblake95/Python_Learning

echo "########################################################################"
echo "### Setting pointers for config files to appropriate locations       ###"
echo "########################################################################"
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.bashrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.vimrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.zshrc ~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/alacritty.yml ~/.config/alacritty/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/neofetch.config.conf\
       	~/.config/neofetch/config.conf
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/variety.conf ~/.config/variety/
sudo ln -s ~/Documents/Python_Learning/Freecodecamp_projects/pwdgen.py\
       	/usr/local/bin/pwdgen

echo "########################################################################"
echo "### Done!                                                            ###"
echo "########################################################################"
