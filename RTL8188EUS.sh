#!/bin/bash
RTL8188EUS(){
   m="0"
   path=$(pwd)
   ls "$path"/rtl8188eus > /dev/null 2>&1
   if [ $? -eq 0 ];then
      echo " " 
      echo -e "\e[32mRequired driver already found inside working directory!\e[0m"
   else
      while [ "$m" != "1"  ]
      do
         echo " "
         echo -ne -e "Have you already downloaded the \e[34mrtl8188eus\e[0m driver? (y/n): "
         read answr
         echo " "
         if [ "$answr" == "y" ]
         then
            while [ "1" == "1"  ]
            do
               echo -e "Please input the full path to the directory named \e[34mrtl8188eus\e[0m"
               echo -ne -e "To find the right path you should \e[34mpwd\e[0m as \e[34msu\e[0m in the target directory: "
               read path
               echo -ne -e "Is this right? \e[34m$path\e[0m (y/n): "
               read answr
               if  [ "$answr" == "y" ]
               then
                  cp -r "$path" ./rtl8188eus > /dev/null 2>&1
                  if [ $? -eq 0 ];then 
                     m="1"
                     echo " "
                     echo -e "\e[32mSuccess!\e[0m "
                     break
                  else
                     echo " "
                     echo -e "The path \e[34m$path\e[0m returned an \e[31merror\e[0m."
                     echo " "
                     echo -e "\e[31mPlease double-check and type in the correct path...\e[0m"
                     echo -e "Press \e[34mENTER\e[0m to retry."
                     read -s
                     echo " "
                     clear
                     IMag
                     continue
                  fi
               else
                  echo " "
                  echo -e "\e[31mPlease double-check and type in the correct path...\e[0m"
                  echo -e "Press \e[34mENTER\e[0m to retry."
                  read -s
                  echo " "
                  clear 
                  IMag
               fi
            done
         elif [ "$answr" == "n" ]
         then
            echo -e "\e[34mAll right then, let's me go fetch it for you real fast...\e[0m"
            echo " "
            echo -e "\e[32mFetching from https://github.com/aircrack-ng/rtl8188eus... \e[0m "
            echo " "
            git clone https://github.com/drygdryg/rtl8188eus.git
            echo " "
            echo -e "\e[32mDone!\e[0m "
            m="1"
         else
            echo -e "Trying to get fast with those keys, ain't cha? \e[31mLet's try again...\e[0m"
            echo "Also, please note that capitalization of input in the terminal makes a difference (eg. y != Y )."
            echo -e "Press \e[34mENTER\e[0m to retry."
            read -s
            clear 
            IMag
         fi
      done
      echo " "
   fi
}

