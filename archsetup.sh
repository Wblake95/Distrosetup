#! /usr/bin/env bash
set -e

echo "########################################################################"
echo "### Hello! This is my script that will set up my desktop.            ###"
echo "### I don't have to do it anymore!                                   ###"
echo "########################################################################"

echo "########################################################################"
echo "### Collecting keyrings                                              ###"
echo "########################################################################"
sudo pacman -Sy --needed --noconfirm archlinux-keyring arcolinux-keyring

echo "########################################################################"
echo "### Updating system and installing packages                          ###"
echo "### Skell command for ArcoLinux                                      ###"
echo "### Pacman flatpak pip                                               ###"
echo "########################################################################"
sudo pacman -Syyu
sudo pacman -S --needed --noconfirm vim emacs ranger vifm
sudo pacman -S --needed --noconfirm gimp krita
sudo pacman -S --needed --noconfirm discord steam nvidia
sudo pacman -S --needed --noconfirm flatpak python-pip 

sudo flatpak update
sudo flatpak install com.heroicgameslauncher.hgl\
	com.valvesoftware.Steam.CompatibilityTool.Proton-GE

pip check

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
{
	cd ~/Documents
	git clone https://github.com/Wblake95/Linuxstuff
	git clone https://github.com/Wblake95/Python_Learning
}||{
	echo "There was a problem!"
}
echo "########################################################################"
echo "### Setting pointers for config files to appropriate locations       ###"
echo "########################################################################"
# Environment
echo "Setting environment"
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/environment/.bashrc\
	~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/environment/.vimrc\
	~/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/environment/.zshrc\
	~/
echo "Done"

# .config
echo "Setting configs"
## General
echo "General"
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.conf/alacritty.yml\
	~/.config/alacritty/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.conf/neofetch.config.conf\
       	~/.config/neofetch/config.conf
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.conf/variety.conf\
	~/.config/variety/
echo "Done"

## Ranger
echo "Ranger"
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.conf/ranger/commands.py\
	~/.config/variety/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.conf/ranger/commands_full.py\
	~/.config/variety/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.conf/ranger/rc.conf\
	~/.config/variety/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.conf/ranger/rifle.conf\
	~/.config/variety/
ln -sbf --suffix=.bak ~/Documents/Linuxstuff/.conf/ranger/scope.sh\
	~/.config/variety/
# chmod 755 ~/Documents/Linuxstuff/.conf/ranger/scope.sh
echo "Done"

# Window managers
echo "Window managers"
## Awesomewm
echo "Awesomewm"
mv ~/.config/awesome/autostart.sh\
       	~/.config/awesome/autostart.sh.bak
mv ~/.config/awesome/picom.conf\
       	~/.config/awesome/picom.confbak
mv ~/.config/awesome/rc.lua\
       	~/.config/awesome/rc.lua.bak
cp ~/Documents/Linuxstuff/.conf/autostart.sh\
	~/.config/awesome/
# chmod 755 ~/Documents/Linuxstuff/.conf/autostart.sh
cp ~/Documents/Linuxstuff/.conf/picom.conf\
	~/.config/awesome/
cp ~/Documents/Linuxstuff/.conf/rc.lua\
	~/.config/awesome/
echo "Done"

# Personal command
{
echo "Personal commands"
sudo ln -s ~/Documents/Python_Learning/Freecodecamp_projects/pwdgen.py\
       	 /usr/local/bin/pwdgen
 }||{
	 echo "There was a problem"
 }
echo "Done"
echo "Configs done"

echo "########################################################################"
echo "### Done!                                                            ###"
echo "########################################################################"
