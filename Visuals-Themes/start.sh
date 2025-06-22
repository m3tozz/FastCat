#!/bin/bash
# Made By M3TOZZ

if grep -q $'\r' "$0"; then
  if command -v dos2unix &> /dev/null; then
    dos2unix "$0"
  else
    sed -i 's/\r$//' "$0"
  fi
  exec bash "$0" "$@"
fi

loader() {
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

banner() {
  echo -e '\033[0;36m
\033[0;31m______        _   _____       _
\033[0;33m|  ___|      | | /  __ \     | |
\033[0;34m| |_ __ _ ___| |_| /  \/ __ _| |_
\033[0;35m|  _/ _` / __| __| |    / _` | __|\033[0;31mVisuals-Themes
\033[0;36m| || (_| \__ \ |_| \__/\ (_| | |_
\033[0;31m\_| \__,_|___/\__|\____/\__,_|\__|
\033[1;34m[01]\033[0;32mDragonball \033[1;35m[02]\033[0;32mOne-Piece \033[1;31m[03]\033[0;32mXenia

\e[3m\e[92mThese themes require an image-supporting terminal emulator (e.g. kitty, wezterm, terminology, nammera); otherwise, images won'\''t show up.\e[0m

\033[1;31m[x]Exit  [00]Menu  [D]Default-Theme
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
  cd Dragonball/ && cp -r fastfetch /home/$USER/.config
  clear
  fastfetch

elif [[ $islem == 2 || $islem == 02 ]]; then
  sleep 1
  clear
  loader
  rm -r /home/$USER/.config/fastfetch
  sleep 1
  cd One-Piece/ && cp -r fastfetch /home/$USER/.config
  clear
  fastfetch

elif [[ $islem == 3 || $islem == 03 ]]; then
  sleep 1
  clear
  loader
  rm -r /home/$USER/.config/fastfetch
  sleep 1
  cd Xenia/ && cp -r fastfetch /home/$USER/.config
  clear
  fastfetch

elif [[ $islem == 00 ]]; then
  sleep 1
  cd ..
  bash ./fastcat.sh -s

elif [[ $islem == D || $islem == d ]]; then
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
