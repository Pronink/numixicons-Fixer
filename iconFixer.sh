function addPairs() {
	laiArray=$laiArray$1".desktop:"$2" "
}
function setIcon() {
	sed -i s/.*Icon=.*/Icon=$2/ /usr/share/applications/$1
}

# Test root privileges
if [ $(whoami) != "root" ]; then
	printf "\e[31;1mThis script needs root permissions to run\e[0m\n"
	printf "\e[38;5;208;1mPress ENTER to exit"
	read key
	printf "\e[0m\n"
	exit 1
fi

# Welcome message
clear
printf "\e[97;44;1mnumixicons-Fixer     by Pronink     for Antergos\e[0m\n"
printf "\e[34;1mThis script will rewrite some lines of .desktop files for set the correct icons to some programs. \e[0m\n"
printf "\e[34;1mA copy of \e[0m/usr/share/applications\e[34;1m folder will be copied to \e[0m$PWD/applications \n\n"

# Test if user wants to continue
printf "\e[38;5;208;1mStart process ? \e[31;1mn\e[0m/\e[32;1my\e[0m\n"
read continuee
if [ $continuee != "y" ]; then
	exit 0
fi

# PROGRAM STARTS ------------------------------------------------------------
# Create backup
cp -Rf /usr/share/applications $PWD/applications

# Launcher and Icon Array
laiArray=""

# List of launchers and the new icon name
# You can add more items but it can't contains ":" or spaces
addPairs org.gnome.Calendar gnome-calendar
addPairs org.gnome.Cheese cheese
addPairs CMake cmake-gui
addPairs hplip hp_logo
addPairs org.gnome.Documents gnome-documents
addPairs playonlinux playonlinux
addPairs org.gnome.Books google-play-books
addPairs org.gnome.Maps gnome-maps
addPairs org.gnome.Weather.Application gnome-weather
addPairs org.gnome.bijiben bijiben

# Get a pair and modify the .desktop file
printf "\n"
for i in $laiArray; do
	launcher=$(echo $i | cut -d: -f1)
	icon=$(echo $i | cut -d: -f2)
	printf "\e[32;1mChanging \e[0m$launcher\e[32;1m icon...\n\e[31;1m"
	setIcon $launcher $icon
	printf "\e[0m"
done

# PROGRAM ENDS ------------------------------------------------------------
# Final messages
printf "\n\e[38;5;208;1m"
printf "For changes to take effect, you must restart gnome-shell.\n"
printf "To do that, you just press ALT + F2, then type \"r\" and press ENTER\n"
printf "If it does't work, you can also close and open session.\n\n"
printf "If you found non-adapted programs or bugs, please contact to me:\n"
printf "https://github.com/Pronink/numixicons-Fixer\n\n"
printf "Press ENTER to exit"
read key
printf "\e[0m\n"
