function addPairs() {
	laiArray=$laiArray$1".desktop:"$2" "
}
function setIcon() {
	sed -i s/.*Icon=.*/Icon=$2/ /usr/share/applications/$1
}
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

printf "\n"
for i in $laiArray; do
	launcher=$(echo $i | cut -d: -f1)
	icon=$(echo $i | cut -d: -f2)
	printf "\e[38;5;208mChanging \e[0m$launcher\e[38;5;208m icon (\e[0m$icon\e[38;5;208m)\e[0m\n"
	setIcon $launcher $icon
done
printf "\n\e[38;5;208m"
printf "For changes to take effect, you must restart gnome-shell.\n"
printf "To do that, you just press ALT + F2, then type \"r\" and finally press ENTER\n"
printf "If it does't work, you can also close and open session.\n"
printf "If you found non-adapted programs or bugs, please contact to me:\n"
printf "https://github.com/Pronink/numixicons-Fixer\n"
printf "\e[0m\n"
