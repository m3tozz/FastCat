    echo -e '\033[1;36m
    ______           __  ______      __ 
   / ____/___ ______/ /_/ ____/___ _/ /_
  / /_  / __ `/ ___/ __/ /   / __ `/ __/
 / __/ / /_/ (__  ) /_/ /___/ /_/ / /_  
/_/    \__,_/____/\__/\____/\__,_/\__/  
 FastFetch Theme Pack                             
\033[0m'

FONT_DIR="$HOME/.fonts"

if [ ! -d "$FONT_DIR" ]; then
    echo "Creating ~/.fonts directory..."
    mkdir -p "$FONT_DIR"
else
    echo "~/.fonts directory already exists."
fi

echo "Downloading CascadiaCode Nerd Font..."
wget -q -P "$FONT_DIR" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CascadiaCode.zip

echo "Extracting font files..."
unzip -oq "$FONT_DIR/CascadiaCode.zip" -d "$FONT_DIR"

echo "Cleaning up..."
rm "$FONT_DIR/CascadiaCode.zip"

echo "Refreshing font cache..."
fc-cache -fv

echo -e "\nInstallation complete! Please open a new terminal and select 'CascadiaCove Nerd Font Regular' in your terminal settings."
