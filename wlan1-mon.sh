source ./ADPR.sh
source ./IMag.sh
source ./LOCATE.sh
source ./RTL8188EUS.sh

while getopts ":h" option; do
   case $option in
      h) # display Help
         echo " "
         echo -e "This is a simple script to initialize your tp-link TL-WN722N V2/V3 adapter (\e[34mwlan#\e[0m), so that it can be used as a monitoring and injecting asset."
         echo "This script doesn't mess in any way with the network-manager settings or the other adapters. Everything else will stay as is."
         echo -e "\e[34mIt needs to always be run as user root - not via sudo.\e[0m Anything else will simply fail, possibly deleting useful files in the midst."
         echo -e  "So, before ./wlan1-mon.sh, make sure to have switched using \e[34msu\e[0m."
         echo " "
         echo "You don't need to have the required driver previously downloaded or installed. And, even if you do, this script will still work."
         echo " "
         exit;;
   esac
done

if [[ $EUID -ne 0 ]]; then
   echo " "
   echo -e "\e[31mThis script must be run as root user!\e[0m"
   echo -e "Please switch to root user with the command \e[34msu\e[0m and run the script again."
   echo " "
   exit 1
   fi

clear
LOCATE
echo " "
echo "This is a simple script to initialize the tp-link TL-WN722N V2/V3 adapter (wlan#) into monitor mode."
echo " "
echo -e "Press \e[34mENTER\e[0m to \e[34mstart\e[0m."
echo -e "Press \e[31mCTRL+C\e[0m to \e[31mquit\e[0m (if for example this isn't the modem you're using). "
echo " "
read -s
echo " "
clear
IMag
RTL8188EUS
echo -e "\e[32mLet's roll! \e[0m"
echo " "
cd ./rtl8188eus
sudo rmmod r8188eu.ko > /dev/null 2>&1
echo "blacklist r8188eu.ko" > "/etc/modprobe.d/realtek.conf"
echo -e "\e[32mCompiling... \e[0m "
make > /dev/null 2>&1
echo " "
echo -e "\e[32mInstalling... \e[0m "
echo " "
sudo make install > /dev/null 2>&1
sudo modprobe 8188eu > /dev/null 2>&1
echo " "
ADPR
echo " "
echo -e "\e[34mPlease check if your adapter has been set to Mode:Monitor. If not seek further assistance through other installations.\e[0m"
echo " "
sudo iwconfig
echo " "
echo -e "\e[34mAll's ready now! \e[0m"
echo " "
LOCATE
su kali

