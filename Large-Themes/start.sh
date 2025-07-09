#!/bin/bash

# This block ensures the script runs correctly on Unix/macOS even if created or modified on Windows.
if grep -q $'\r' "$0"; then # Check if the script contains Windows-style carriage returns.
  # Option 1: Prefer 'dos2unix' tool if available.
  if command -v dos2unix &> /dev/null; then
    dos2unix "$0"
  # Option 2: Handle macOS specific 'sed' behaviors.
  elif [[ "$(uname)" == "Darwin" ]]; then
    # On macOS, use 'gsed' (GNU sed, typically installed via Homebrew) if available.
    if command -v gsed &> /dev/null; then
      gsed -i 's/\r$//' "$0" # Remove carriage returns in-place.
    # If 'gsed' not found on macOS, use default 'sed' (BSD sed), which requires -i ''.
    elif command -v sed &> /dev/null; then
      sed -i '' 's/\r$//' "$0"
    else
      # Warning for macOS if no suitable tool found.
      echo "Warning: Neither dos2unix, gsed, nor sed found to convert line endings on macOS for '$0'. Script might fail." >&2
    fi
  # Option 3: Handle Linux and other Unix-like systems (where 'sed' is typically GNU sed by default).
  elif command -v sed &> /dev/null; then
    sed -i 's/\r$//' "$0" # Use standard sed to remove carriage returns in-place.
  else
    # General warning if no compatible tool found on any OS.
    echo "Warning: No suitable tool found to convert line endings for '$0'. Script might fail due to CRLF issues." >&2
  fi
  # Re-execute the script with corrected line endings.
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
\033[1;31m[x]Exit [00]Menu [D]Default-Theme
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

elif [[ $islem == 11 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Groups/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 12 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Rose/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 13 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Fedora/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 14 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Arch/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 15 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Hyprland/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 16 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Simpsons/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 17 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Origami/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 18 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Home/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 19 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd DeadPool/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 20 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Superman/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 21 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Spider-Man/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 22 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Triangle/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 23 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Stars/ && cp -r fastfetch /home/$USER/.config
clear
fastfetch

elif [[ $islem == 24 ]]; then
	sleep 1
	clear
	loader
rm -r /home/$USER/.config/fastfetch
sleep 1
        cd Yandere-Girl/ && cp -r fastfetch /home/$USER/.config
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
