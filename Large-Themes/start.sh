#!/usr/bin/env bash
if grep -q $'\r' "$0"; then
    # Script has CRLF, try to fix it
    if command -v dos2unix &>/dev/null; then
        dos2unix "$0"
    elif [[ "$(uname)" == "Darwin" ]] && command -v gsed &>/dev/null; then
        gsed -i 's/\r$//' "$0" # Use gsed on macOS if available
    elif [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' 's/\r$//' "$0" # Use BSD sed on macOS
    else
        sed -i 's/\r$//' "$0" # Use GNU sed on Linux
    fi
    # Re-execute the script with the corrected line endings
    exec bash "$0" "$@"
fi
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
\e[1;35m[09]\e[0;32mJurassic \033[1;33m[10]\e[0;32mBatMan \e[1;34m[11]\e[0;32mGroups \e[1;31m[12]\e[0;32mRose
\e[0;36m[13]\e[0;32mFedora \e[1;34m[14]\e[0;32mArch \e[1;35m[15]\e[0;32mHyprland \e[1;34m[16]\e[0;32mSimpsons
\033[1;33m[17]\e[0;32mOrigami \e[1;35m[18]\e[0;32mHome \033[1;33m[19]\e[0;32mDeadPool \033[0;36m[20]\e[0;32mSuperman
\e[1;34m[21]\e[0;32mSpider-Man \e[0;36m[22]\e[0;32mTriangle \033[1;33m[23]\e[0;32mStars \e[1;35m[24]\e[0;32mYandere-Girl
\e[1;34m[25]\e[0;32mTheLead \e[1;35m[26]\e[0;32mShirazTux \e[1;31m[27]\e[0;32mKaviani-Derafsh \e[1;35m[28]\e[0;32mArthur-Morgan-hat
\e[1;31m[29]\e[0;32mMetoCat \e[1;33m[30]\e[0;32mShiraz-Linux \e[1;35m[31]\e[0;32mBulla-Cachy \e[1;34m[32]\e[0;32mPhoenix
\e[1;30m[33]\e[0;32mDragon
\033[1;31m[x]Exit [00]Menu [D]Default-Theme
'
        echo -ne "\e[1;33mm3tozz\e[0;31m@\033[1;34mfastcat\n\e[0;31m↳\e[1;36m " ; read islem
}
banner
if [[ $islem == 1 || $islem == 01 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Anime-Boy/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 2 || $islem == 02 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Death/ && cp -r fastfetch ~/.config
clear	
fastfetch
elif [[ $islem == 3 || $islem == 03 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Pentagram/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 4 || $islem == 04 ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd Scorpion/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == 5 || $islem == 05 ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd Anime-Girl/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == 6 || $islem == 06 ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd Saturn/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == 7 || $islem == 07 ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd Suse-Icons/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == 8 || $islem == 08 ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd Cat/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == 9 || $islem == 09 ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd Jurassic/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == 10 ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd BatMan/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == 11 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Groups/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 12 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Rose/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 13 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Fedora/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 14 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Arch/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 15 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Hyprland/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 16 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Simpsons/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 17 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Origami/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 18 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Home/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 19 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd DeadPool/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 20 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Superman/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 21 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Spider-Man/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 22 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Triangle/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 23 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Stars/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 24 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Yandere-Girl/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 25 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd TheLead/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 26 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
mkdir -p ~/.config/fastfetch/
        cd ShirazTux/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 27 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
mkdir -p ~/.config/fastfetch/
        cd Kaviani-Derafsh/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 28 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
mkdir -p ~/.config/fastfetch/
mv "Arthur-Morgan's-hat" "Arthur-Morgan-hat"
cd    Arthur-Morgan-hat/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 29 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd MetoCat/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 30 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd Shiraz-Linux/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 31 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd Bulla-Cachy/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 32 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd Phoenix/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[ $islem == 33 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch/
sleep 1
		mkdir -p ~/.config/fastfetch/
        cd Dragon/ && cp -r fastfetch ~/.config
clear
fastfetch
elif [[  $islem == 00 ]]; then
        sleep 1
        cd ..
        bash ./fastcat.sh -s
elif [[ $islem == D || $islem == d  ]]; then
        sleep 1
        clear
        loader
rm -r ~/.config/fastfetch
sleep 1
        cd Default/ && cp -r fastfetch ~/.config
clear   
fastfetch
elif [[ $islem == x || $islem == X ]]; then
	clear
echo -e "\033[1;31m GoodBye\033[0m"
	exit 1
else
	echo -e '\033[36;40;1m Wrong transaction number!'	
fi
