# Made By M3TOZZ
loader ()
{
printf "\033[0m
FastCat - FastFetch Theme Pack!
[#####               ] 25%%  completed.\r"
sleep 0.3
clear
printf "
FastCat - FastFetch Theme Pack!
[###############     ] 75%%  completed.\r"
sleep 0.2
clear
printf "
FastCat - FastFetch Theme Pack!
[####################] 100%%  completed.\r"
sleep 0.2
}

clear
banner(){
echo -e '\033[0;36m
\033[0;31m______        _   _____       _   
\033[0;33m|  ___|      | | /  __ \     | |  
\033[0;34m| |_ __ _ ___| |_| /  \/ __ _| |_ 
\033[0;35m|  _/ _` / __| __| |    / _` | __|\033[0;31mLarge-Themes
\033[0;36m| || (_| \__ \ |_| \__/\ (_| | |_ 
\033[0;31m\_| \__,_|___/\__|\____/\__,_|\__|                 
\e[1;34m[01]\e[0;32mAnime-Boy \e[1;35m[02]\e[0;32mDeath \e[1;31m[03]\e[0;32mPentagram \033[1;33m[04]\e[0;32mScorpion
\033[1;33m[05]\e[0;32mAnime-Girl \e[1;36m[06]\e[0;32mSaturn \e[1;35m[07]\e[0;32mSuse-Icons \033[0;36m[08]\e[0;32mCat
\e[1;35m[09]\e[0;32mJurassic \033[1;33m[10]\e[0;32mBatMan
\033[1;31m[x]Exit [D]Default-Theme
'
        echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read islem
}



banner
if [[ $islem == 1 || $islem == 01 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Anime-Boy/ && cp -r fastfetch /home/$USER/.config
clear	

fastfetch

elif [[ $islem == 2 || $islem == 02 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Death/ && cp -r fastfetch /home/$USER/.config
clear	

fastfetch
 
elif [[ $islem == 3 || $islem == 03 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Pentagram/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 4 || $islem == 04 ]]; then
        sleep 1
        clear
        loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Scorpion/ && cp -r fastfetch /home/$USER/.config
clear   
fastfetch

elif [[ $islem == 5 || $islem == 05 ]]; then
        sleep 1
        clear
        loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Anime-Girl/ && cp -r fastfetch /home/$USER/.config
clear   
fastfetch

elif [[ $islem == 6 || $islem == 06 ]]; then
        sleep 1
        clear
        loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Saturn/ && cp -r fastfetch /home/$USER/.config
clear   
fastfetch

elif [[ $islem == 7 || $islem == 07 ]]; then
        sleep 1
        clear
        loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Suse-Icons/ && cp -r fastfetch /home/$USER/.config
clear   
fastfetch

elif [[ $islem == 8 || $islem == 08 ]]; then
        sleep 1
        clear
        loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Cat/ && cp -r fastfetch /home/$USER/.config
clear   
fastfetch

elif [[ $islem == 9 || $islem == 09 ]]; then
        sleep 1
        clear
        loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Jurassic/ && cp -r fastfetch /home/$USER/.config
clear   
fastfetch

elif [[ $islem == 10 ]]; then
        sleep 1
        clear
        loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd BatMan/ && cp -r fastfetch /home/$USER/.config
clear   
fastfetch


elif [[ $islem == D || $islem == d  ]]; then
        sleep 1
        clear
        loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Default/ && cp -r fastfetch /home/$USER/.config
clear   
fastfetch

elif [[ $islem == x || $islem == X ]]; then
	clear
echo -e "\033[1;31m GoodBye\033[0m"
	exit 1
else
	echo -e '\033[36;40;1m Wrong transaction number!'	
fi
