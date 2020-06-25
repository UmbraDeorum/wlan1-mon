ADPR(){
echo -e "\e[34mPlease remove and reinsert the adapter.\e[0m"
echo "If it wasn't connected to begin with, please just insert it."
echo -e "After you complete the action, press \e[34mENTER\e[0m to continue."
read  -s
echo " "
echo -ne -e "Please, type the name of your adapter as it appears in \e[34msudo iwconfig\e[0m: "
read adpr
echo " "
echo "Let's hope you didn't mess up... "
echo " "
sudo airmon-ng check kill > /dev/null
sudo ip link set "$adpr" down
sudo iw dev "$adpr" set type monitor
sudo service network-manager start
sudo ifconfig "$adpr" up
}

