# https://github.com/m3tozz/FastCat 

echo -e '\033[1;36m
    ______           __  ______      __ 
   / ____/___ ______/ /_/ ____/___ _/ /_
  / /_  / __ `/ ___/ __/ /   / __ `/ __/
 / __/ / /_/ (__  ) /_/ /___/ /_/ / /_  
/_/    \__,_/____/\__/\____/\__,_/\__/  
 FastFetch Theme Pack                           
\033[0m'

read -p "Do you want to install CascadiaCode Nerd Font? (Y/N): " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then
    FONT_DIR="$HOME/.fonts"

    if [ ! -d "$FONT_DIR" ]; then
        echo -e "\033[1;32mCreating ~/.fonts directory...\033[0m"
        mkdir -p "$FONT_DIR"
    else
        echo -e "\033[1;33m~/.fonts directory already exists.\033[0m"
    fi

    echo -e "\033[1;34mDownloading CascadiaCode Nerd Font...\033[0m"
    wget -q -P "$FONT_DIR" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip

    echo -e "\033[1;34mExtracting font files...\033[0m"
    unzip -oq "$FONT_DIR/CascadiaCode.zip" -d "$FONT_DIR"

    echo -e "\033[1;34mCleaning up...\033[0m"
    rm "$FONT_DIR/CascadiaCode.zip"

    echo -e "\033[1;34mRefreshing font cache...\033[0m"
    fc-cache -fv

echo -e "\nInstallation complete! Please open a new terminal and select 'CascadiaCove Nerd Font Regular' in your terminal settings."
else
    echo -e "\033[1;31mInstallation canceled by user.\033[0m"
fi
