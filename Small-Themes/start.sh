#!/usr/bin/env bash

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
\033[0;35m|  _/ _` / __| __| |    / _` | __|\033[0;31mSmall-Themes
\033[0;36m| || (_| \__ \ |_| \__/\ (_| | |_
\033[0;31m\_| \__,_|___/\__|\____/\__,_|\__|
\e[1;34m[01]\e[0;32mMetoSpace \e[1;35m[02]\e[0;32mFast-Snail \e[1;36m[03]\e[0;32mCat \e[1;31m[04]\e[0;32mMinimal
\e[1;33m[05]\e[0;32mArch \e[1;36m[06]\e[0;32mBlocks \e[1;34m[07]\e[0;32mCocktail \033[1;33m[08]\e[0;32mPalm \033[0;36m[09]\e[0;32mSheriff
\e[1;35m[10]\e[0;32mBunny \e[1;34m[11]\e[0;32mCoffee \e[1;35m[12]\e[0;32mDuck \033[1;33m[13]\e[0;32mOWL \e[1;34m[14]\e[0;32mGiraffe
\e[1;36m[15]\e[0;32mRobo-Dog
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
        cd MetoSpace/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 2 || $islem == 02 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Fast-Snail/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 3 || $islem == 03 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Cat/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 4 || $islem == 04 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Minimal/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 5 || $islem == 05 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Arch/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 6 || $islem == 06 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Blocks/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 7 || $islem == 07 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Cocktail/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 8 || $islem == 08 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Palm/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 9 || $islem == 09 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Sheriff/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 10 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Bunny/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 11 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Coffee/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 12 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Duck/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 13 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd OWL/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 14 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Giraffe/ && cp -r fastfetch ~/.config
clear
fastfetch

elif [[ $islem == 15 ]]; then
	sleep 1
	clear
	loader
rm -r ~/.config/fastfetch
sleep 1
        cd Robo-Dog/ && cp -r fastfetch ~/.config
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
