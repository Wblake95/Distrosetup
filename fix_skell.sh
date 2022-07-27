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

echo "#########################################################################"
echo "### Recreating soft links for configs                                 ###"
echo "#########################################################################"
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

echo "#########################################################################"
echo "### Done! Now will reboot system                                      ###"
echo "#########################################################################"
echo "Will reboot in 10 sec!"
sleep 10
reboot
